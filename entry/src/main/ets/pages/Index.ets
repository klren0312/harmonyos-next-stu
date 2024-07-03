import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State clickSum: number = 0
  @State testText: string = 'test text';
  @State account: string = ''
  @State password: string = ''
  build() {
    RelativeContainer() {
      Column() {
        Row() {
          Text(`${this.testText}`)
            .fontSize(50)
            .fontColor('#fff000')
          Button('点击')
            .width(100)
            .onClick(() => {
              this.testText = 'has click' + this.clickSum
              ++this.clickSum
            })
        }
        Divider()
        Row() {
          Text('账号：')
          TextInput({
            text: this.account,
            placeholder: '请输入账号'
          })
            .width('50%')
            .borderRadius(0)
            .onChange((value) => this.account = value)
        }
          .margin({
            top: 10,
            bottom: 10
          })
        Row() {
          Text('密码：')
          TextInput({
            text: this.password,
            placeholder: '请输入密码'
          })
            .type(InputType.Password)
            .width('50%')
            .borderRadius(0)
            .showPasswordIcon(true)
            .onChange((value) => this.password = value)
        }.margin({
          bottom: 20
        })
        Row() {
          Button('登录')
            .onClick(() => {
              if (this.account && this.password) {
                promptAction.showToast({
                  message: `账号：${this.account}，密码：${this.password}`
                })
              } else {
                promptAction.showToast({
                  message: '请输入账号密码'
                })
              }
            })
            .width('80%')
        }
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