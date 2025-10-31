@Entry
@Component
struct Index {
  @State currentPage: string = '欢迎页面';

  build() {
    Row() {
      // 左侧侧边栏
      Column() {
        Text('   ')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.currentPage = '这是测试页面';
          })
        Text('1')
          .fontSize(16)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.currentPage = '页面 1 内容';
          })
        Text('2')
          .fontSize(16)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.currentPage = '页面 2 内容';
          })
        Text('3')
          .fontSize(16)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.currentPage = '页面 3 内容';
          })
      }
      .width(100)
      .height('100%')
      .backgroundColor('#F5F5F5')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      // 右侧主显示区
      Column() {
        Text(this.currentPage)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
