import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State clickSum: number = 0
  @State testText: string = 'test text';
  build() {
    RelativeContainer() {
      Column() {
        Text(`${this.testText}`)
          .fontSize(50)
          .fontColor('#fff000')
        Divider()
        Button('点击')
          .backgroundColor('#fff000')
          .onClick(() => {
            this.testText = 'has click' + this.clickSum
            ++this.clickSum
          })
      }
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}