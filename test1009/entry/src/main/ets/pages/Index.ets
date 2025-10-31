@Entry
@Component
struct Index {
  @State currentIndex: number = 0; // 当前图片索引
  @State isPlaying: boolean = false; // 是否正在轮播
  private timer: number = 0; // 定时器

  // ✅ 图片资源数组（支持 Resource 类型）
  private images: (string | Resource)[] = [
    $r('app.media.1228505'),
    $r('app.media.1362727'),
    $r('app.media.1367166')
  ];

  build() {
    Column({ space: 20 }) {
      // 图片显示区域
      Image(this.images[this.currentIndex])
        .width('90%')
        .height(250)
        .objectFit(ImageFit.Cover)
        .borderRadius(15)
        .margin({ top: 30 })
        .animation({ duration: 300 }) // 切换动画

      // 按钮区域
      Row({ space: 30 }) {
        Button('开始轮播')
          .type(ButtonType.Capsule)
          .width(120)
          .onClick(() => {
            if (!this.isPlaying) {
              this.startSlideshow();
            }
          })

        Button('暂停轮播')
          .type(ButtonType.Capsule)
          .width(120)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            if (this.isPlaying) {
              this.stopSlideshow();
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  // 开始轮播
  startSlideshow() {
    this.isPlaying = true;
    this.timer = setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.images.length;
    }, 2000); // 每2秒切换一次
  }

  // 暂停轮播
  stopSlideshow() {
    this.isPlaying = fa lse;
    clearInterval(this.timer);
  }

  aboutToDisappear() {
    if (this.timer) {
      clearInterval(this.timer);
    }
  }
}
