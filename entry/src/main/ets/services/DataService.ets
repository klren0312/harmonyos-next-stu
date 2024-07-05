import http from '@ohos.net.http'

const req = http.createHttp()

export function GetDataApi () {
  return req.request('https://cnodejs.org/api/v1/topics').then(res => res.result)
}