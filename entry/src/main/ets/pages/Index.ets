import { promptAction } from '@kit.ArkUI'
import router from '@ohos.router'
interface IPerson {
  name: string,
  age: number,
  say: () => void
}

@Extend(Text) function cusClick(color: string, cb: () => void) {
  .backgroundColor(color)
  .width(100)
  .height(50)
  .textAlign(TextAlign.Center)
  .borderRadius(25)
  .onClick(() => cb())
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State clickSum: number = 0
  @State testText: string = `${this.clickSum}`;
  @State account: string = ''
  @State password: string = ''
  @State dataLoading: boolean = true
  @State
  person: IPerson = {
    name: 'hm',
    age: 11,
    say: (): void => {
      throw new Error('Function not implemented.');
    }
  }
  @State dataArr: string[] = ['test1', 'test2', 'test3']

  @Styles
  doCenter() {
    .onClick(() => {
      this.testText = `${this.person.age}`
      ++this.clickSum
      ++this.person.age
    })
  }

  @Styles
  inputStyles() {
    .layoutWeight(1)
    .width('100%')
    .borderRadius(0)
  }

  build() {
    RelativeContainer() {
      Column() {
        // nav
        Row() {
          Row() {
            Image($r('app.media.back'))
              .width(12)
              .aspectRatio(1)
              .fillColor('#848484')
          }
          .onClick(() => {
            router.back()
          })
          .aspectRatio(1)
          .width(24)
          .height(24)
          .justifyContent(FlexAlign.Center)
          .borderRadius(12)
          .backgroundColor('#f5f5f5')
          .margin({ left: 16 })
          Text('评论回复')
            .layoutWeight(1)
            .fontSize(18)
            .textAlign(TextAlign.Center)
            .padding({ right: 40 })
        }
        .height(40)
        .border({
          width: { bottom: 0.5 },
          color: '#e4e4e4'
        })
        // 评论
        Row(){
          Image($r('app.media.app_icon'))
            .width(32)
            .aspectRatio(1)
            .borderRadius(15)
          Column({
            space: 5
          }) {
            Text('某某某')
              .width('100%')
              .fontSize(15)
              .fontWeight(FontWeight.Bold)
            Text('设计稿一般是1080px：(这里没有设计稿，提供了一些尺寸)')
              .width('100%')
              .fontSize(16)
              .fontColor('#565656')
              .textAlign(TextAlign.Start)
            Row() {
              Text('2024-07-04 11:11:11')
                .fontSize(12)
                .fontColor('#c3c4c5')
              Row() {
                Image($r('app.media.agree'))
                  .width(14)
                  .aspectRatio(1)
                  .fillColor('#c3c4c5')
                Text('109')
                  .fontSize(12)
                  .fontColor('#c3c4c5')
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .layoutWeight(1)
          .padding({ left: 10 })
        }
        .padding(15)
        .alignItems(VerticalAlign.Top)

        // 登录框
        Column() {
          Row() {
            Text(`${this.testText}`)
              .fontSize(50)
              .fontColor('#fff000')
              .doCenter()
            Button('点击')
              .width(100)
              .doCenter()
          }
          Divider()
          Row() {
            Text('账号：')
            TextInput({
              text: this.account,
              placeholder: '请输入账号'
            })
              .inputStyles()
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
              .inputStyles()
              .type(InputType.Password)
              .showPasswordIcon(true)
              .onChange((value) => this.password = value)
          }
          .margin({
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
        .padding(20)
        .alignItems(HorizontalAlign.Center)

        Column() {
          Text('test1')
            .cusClick('#ff99ff', () => {
              this.dataLoading = false
              promptAction.showDialog({
                message: 'testtest',
                title: '提示',
                shadow: {
                  radius: 1
                }
              })
            })
            .stateStyles({
              normal: {
                .backgroundColor(Color.Blue)
              },
              focused: {
                .backgroundColor(Color.Red)
              },
              disabled: {
                .backgroundColor(Color.Black)
              },
              pressed: {
                .backgroundColor(Color.Orange)
              }
            })
        }
        Column() {
          if (this.dataLoading) {
            LoadingProgress()
          } else {
            ForEach(
              this.dataArr,
              (item: string) => {
                Text(item)
              },
              (item: string, index: number) => item + index
            )
          }
        }
      }
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
    .width('100%')
  }
}
