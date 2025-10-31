@Entry
@Component
struct Index {

  // 定义“单击菜单”的内容
  @Builder
  ClickMenu() {
    Menu() {
      MenuItem({ content: '新建', labelInfo: 'Ctrl+N' })
      MenuItem({ content: '发送邮件' })
      MenuItem({ content: '下载邮件' })
    }
    .fontSize(24)
  }

  // 定义“长按菜单”的内容
  @Builder
  PressMenu() {
    Menu() {
      MenuItemGroup({ header: '操作选项' }) {
        MenuItem({ content: '发送附件' })
        MenuItem({ content: '下载附件' })
      }
    }
    .fontSize(24)
  }

  build() {
    Row() {
      Column() {
        // 单击按钮弹出菜单
        Button('单击显示菜单')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .bindMenu(this.ClickMenu())
          .padding(20)

        // 长按按钮弹出菜单
        Button('长按显示菜单')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .bindContextMenu(this.PressMenu(), ResponseType.LongPress)
          .padding(20)
          .margin(30)
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
