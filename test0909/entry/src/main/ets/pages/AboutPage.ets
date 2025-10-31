import router from '@ohos.router';

// 声明页面入口组件
@Entry
@Component
struct AboutPage {

  // 构建页面UI结构
  build() {
    Column() {
      // 页面标题文本，居中显示，使用白色粗体大字号
      Text($r('app.string.about_page_title'))
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .margin({ top: 40, bottom: 20 })

      // 页面内容说明文字，居中对齐，设置边距和字体样式
      Text($r('app.string.about_page_content'))
        .fontSize(18)
        .textAlign(TextAlign.Center)
        .fontColor(Color.White)
        .margin({ left: 20, right: 20, bottom: 40 })

      // 返回按钮，点击后触发页面返回操作
      Button($r('app.string.back_button'))
        .width('80%')               // 设置按钮宽度为屏幕的80%
        .height(48)                 // 设置按钮高度
        .fontSize(18)              // 设置按钮文字大小
        .fontColor(Color.White)    // 设置按钮文字颜色
        .onClick(() => {
          router.back();           // 调用路由返回方法，返回上一页面
        })
    }
    // 设置页面整体宽高和背景色
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }
}