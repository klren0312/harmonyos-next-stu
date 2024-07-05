import router from '@ohos.router'
import { GetDataApi } from '../services/DataService'
interface MoreBuildParams {
  title: string;
}

@Entry
@Component
struct Comment {
  @Builder
  MoreBuilder (params: MoreBuildParams) {
    Row() {
      Text(params.title)
        .fontSize(14)
        .fontColor('#666')
    }
  }

  @State propMessage: string = 'prop传值'
  @State linkMessage: number = 0
  @Provide
  provideMessage: number = 100

  build() {
    Column() {
      ChildComp({ propMessage: this.propMessage, linkMessage: $linkMessage })

      Text(this.propMessage + this.linkMessage)
        .fontColor('#ff0000')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.linkMessage += 50
          this.provideMessage += 100
        })
      GridRow({ columns: 2, gutter: 15 }) {
        GridCol({ span: 2 }) {
          Column(){
            Row() {
              Text('评论')
                .layoutWeight(1)
                .fontWeight(FontWeight.Bold)
              this.MoreBuilder({title: '查看更多'})
            }
            .padding(10)
            Row() {}
              .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
        GridCol() {
          Column(){
            Row() {
              Text('评论')
                .layoutWeight(1)
                .fontWeight(FontWeight.Bold)
              this.MoreBuilder({title: '查看更多2'})
            }
            .padding(10)
            Row() {}
            .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
        GridCol() {
          Column(){
            Row() {
              Text('评论')
                .layoutWeight(1)
                .fontWeight(FontWeight.Bold)
              this.MoreBuilder({title: '查看更多3'})
            }
            .padding(10)
            Row() {}
            .height(100)
          }
          .borderRadius(12)
          .backgroundColor('#fff')
        }
      }
      Button('测试')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Index'
          })
        })
    }
    .padding(15)
    .height('100%')
    .backgroundColor('#efefef')
  }
}

interface Person {
  name: string
  age: number
}

@Component
struct ChildComp {
  @State
  person: Person = { name: 'jack', age: 19 }

  @Prop
  propMessage: string

  @Link
  linkMessage: number

  build() {
    Column() {
      ChildObjComp({person: $person})
      CommonText({ text: this.propMessage, color: Color.Blue})
        .onClick(() => {
          this.propMessage = 'fewafe'
          this.person.age++
        })
      CommonText({ text: `child: ${this.linkMessage}`, color: Color.Green})
        .onClick(() => {
          this.linkMessage ++
        })
    }

  }
}

@Component
struct ChildObjComp {
  @Link
  @Watch('onPersonChange')
  person: Person

  @Consume
  provideMessage: number

  async aboutToAppear() {
    let res = await GetDataApi()
    this.person.name = res.toString()
  }
  onPersonChange() {
    this.provideMessage += 333
  }

  build() {
    Column() {
      Text(this.person.name)
      Text(this.person.age + '')
      Text(this.provideMessage + '')
    }
  }
}

@Component
struct CommonText{
  @Prop
  text: string
  @Prop
  color: string | Color

  build() {
    Text(this.text)
      .fontColor(this.color)
      .fontSize(28)
      .fontWeight(FontWeight.Bold)
  }
}