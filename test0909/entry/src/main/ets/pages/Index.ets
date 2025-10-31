import router from '@ohos.router';
import preferences from '@ohos.data.preferences';
import hilog from '@ohos.hilog';

const TAG: string = '[IndexPage]';
const DOMAIN: number = 0xFF00;
const PREFERENCES_KEY = 'question_count';

@Entry
@Component
struct Index {

  // 响应式状态变量：当前回答文本、动画状态、提问次数等
  @State answer: string = '';
  @State thinking: boolean = false;
  @State textScale: number = 1;
  @State textOpacity: number = 1;
  @State questionCount: number = 0;

  // 固定回答池，用于随机选择
  private answers: string[] = [
    "毫无疑问。", "是的，绝对是。", "看起来不错。", "前景光明。",
    "如我所见，是的。", "很有可能。", "相信你的直觉。", "迹象表明是的。",
    "回复模糊，再试一次。", "晚点再问。", "最好现在不告诉你。", "无法预测。",
    "专注并再问一次。", "不要指望它。", "我的回复是否定的。", "我的消息来源说不。",
    "前景不妙。", "非常怀疑。"
  ];

  // 获取本地持久化配置对象，用于读写提问次数
  private async getPreferences() {
    let context = getContext(this);
    return await preferences.getPreferences(context, 'magic8ball_prefs');
  }

  // 页面生命周期钩子：加载时初始化状态并读取持久化数据
  async aboutToAppear() {
    try {
      const prefs = await this.getPreferences();
      const count = await prefs.get(PREFERENCES_KEY, 0) as number;
      this.questionCount = count;
      hilog.info(DOMAIN, TAG, `Successfully read question count: ${count}`);
    } catch (e) {
      hilog.error(DOMAIN, TAG, `Failed to read question count. Cause: ${JSON.stringify(e)}`);
    }

    let context = getContext(this);
    this.answer = await context.resourceManager.getStringValue($r('app.string.initial_answer'));
  }

  // 用户点击“提问”按钮触发：更新回答、动画、持久化次数
  private getAnswer() {
    if (this.thinking) {
      return;
    }

    this.thinking = true;
    let context = getContext(this);
    context.resourceManager.getStringValue($r('app.string.thinking_text')).then(res => {
      this.answer = res;
    });

    // 模拟思考延迟，随后更新回答与动画
    setTimeout(async () => {
      const randomIndex = Math.floor(Math.random() * this.answers.length);
      this.answer = this.answers[randomIndex];
      this.thinking = false;

      this.questionCount++;
      try {
        const prefs = await this.getPreferences();
        await prefs.put(PREFERENCES_KEY, this.questionCount);
        await prefs.flush();
        hilog.info(DOMAIN, TAG, `Successfully saved question count: ${this.questionCount}`);
      } catch (e) {
        hilog.error(DOMAIN, TAG, `Failed to save question count. Cause: ${JSON.stringify(e)}`);
      }

      // 回答动画：缩放与透明度渐变
      this.textScale = 0.8;
      this.textOpacity = 0;
      animateTo({ duration: 300, curve: Curve.EaseInOut }, () => {
        this.textScale = 1;
        this.textOpacity = 1;
      });
    }, 1000);
  }

  // 构建页面UI结构与交互逻辑
  build() {
    Column() {
      // 应用标题
      Text($r('app.string.app_title'))
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_color'))
        .margin({ top: 80 })

      // 神奇8号球区域：圆形背景 + 动态回答文本
      Stack({ alignContent: Alignment.Center }) {
        Circle()
          .width(300)
          .height(300)
          .fill($r('app.color.answer_bg_color'))

        Text(this.answer)
          .fontSize(24)
          .fontColor($r('app.color.answer_text_color'))
          .textAlign(TextAlign.Center)
          .padding(20)
          .width(220)
          .scale({ x: this.textScale, y: this.textScale })
          .opacity(this.textOpacity)
      }
      .margin({ top: 40, bottom: 40 })

      // 提问按钮：触发回答逻辑，禁用状态防止重复点击
      Button($r('app.string.ask_button'))
        .width('80%')
        .height(50)
        .fontSize(20)
        .backgroundColor($r('app.color.button_bg_color'))
        .fontColor($r('app.color.button_text_color'))
        .onClick(() => this.getAnswer())
        .enabled(!this.thinking)

      // 提问次数统计信息展示
      Row() {
        Text($r('app.string.question_count_prefix'))
          .fontSize(16)
          .fontColor($r('app.color.title_color'))
        Text(` ${this.questionCount} `)
          .fontWeight(FontWeight.Bold)
          .fontSize(16)
          .fontColor($r('app.color.title_color'))
        Text($r('app.string.question_count_suffix'))
          .fontSize(16)
          .fontColor($r('app.color.title_color'))
      }
      .margin({ top: 20 })

      // 页面间隔占位
      Blank()

      // 跳转到“关于”页面按钮
      Button($r('app.string.about_page_button'))
        .width('80%')
        .height(40)
        .fontSize(16)
        .type(ButtonType.Capsule)
        .backgroundColor($r('app.color.answer_bg_color'))
        .margin({ bottom: 30 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/AboutPage' })
            .catch((err: Error) => {
              hilog.error(DOMAIN, TAG, `Failed to route to AboutPage. Cause: ${err?.message}`);
            });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.app_bg'))
  }
}