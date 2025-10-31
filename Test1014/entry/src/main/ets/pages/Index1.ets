@Entry
@Component
struct Index {
  @State value: number = 50

  build() {
    Column() {
      // 线形进度条
      Progress({ value: this.value, total: 100, type: ProgressType.Linear })
        .width('80%')
        .color(Color.Green)

      // 圆形进度条
      Progress({ value: this.value, total: 100, type: ProgressType.Ring })
        .width('30%')
        .margin({ top: 30 })

      // 椭圆形进度条
      Progress({ value: this.value, total: 100, type: ProgressType.Eclipse })
        .width('30%')
        .margin({ top: 30 })

      // 带刻度环形进度条
      Progress({ value: this.value, total: 100, type: ProgressType.ScaleRing })
        .width('30%')
        .margin({ top: 30 })

      // 红色环形刻度进度条
      Progress({ value: 60, total: 100, type: ProgressType.ScaleRing })
        .width('30%')
        .color(Color.Red)
        .style({
          strokeWidth: 20,
          scaleCount: 10,
          scaleWidth: 10
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}
