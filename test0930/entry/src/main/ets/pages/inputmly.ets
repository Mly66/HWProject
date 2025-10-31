@Entry
@Component
struct InputDemo {
  // 定义一个响应式变量，用来存储输入内容
  text: string = ""

  build() {
    Column() {
      // 输入框
      TextField("请输入内容", text: self.text)
      .width("100%")
        .height("50px")
        .margin({top: 20, left: 20, right: 20})
        .backgroundColor(Color.White)
        .borderRadius(8)
        .onTextChange((value) => {
          self.text = value
        })

      // 显示输入内容
      Text(self.text)
        .width("100%")
        .margin({top: 20, left: 20})
        .fontSize(24)
        .textColor(Color.Black)
    }
    .padding(10)
    .backgroundColor(Color.LightGray)
  }
}
