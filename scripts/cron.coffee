# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob

ary = ['森下君', '佐藤君', '肥田君', '中谷君', '植木君', '永井君']

module.exports = (robot) ->

  # 特定のチャンネルへ送信するメソッド(定期実行時に呼ばれる)　
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  # #nacと言う部屋に、平日の17:30時に実行
  new cronJob('0 51 16 * * 1-5', () ->
    # ↑のほうで宣言しているsendメソッドを実行する
    send '#nac', "#{ ary[Math.floor( Math.random() * 6 )] }"
  ).start()

  # #nacと言う部屋に、平日の16:00時に実行
  new cronJob('0 51 8 * * 1-5', () ->
    send '#nac', "#{ ary[Math.floor( Math.random() * 6 )] }"
  ).start()
