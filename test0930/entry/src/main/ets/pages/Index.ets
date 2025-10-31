import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Index {
  readonly foods: string[] = [
    '河南胡辣汤',
    '湖北热干面',
    '潮汕牛肉丸',
    '新疆大盘鸡',
    '广西螺蛳粉'
  ];

  handlePickerChange(value: string | string[], index: number | number[]) {
    promptAction.showToast({
      message: `${value} -> ${index}`,
      duration: 2000
    });
  }

  build() {
    Row() {
      Column() {
        TextPicker({
          range: this.foods,
          selected: 0,
          value: this.foods[0]
        })
          .defaultPickerItemHeight(60)
          .onChange((value, index) => this.handlePickerChange(value, index));
      }
    }
    .width('100%')
    .height('100%');
  }
}
