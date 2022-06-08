# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob


module.exports = (robot) ->

  # 特定のチャンネルへ送信するメソッド(定期実行時に呼ばれる)　
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  # #nacと言う部屋に、平日の17:30時に実行
  new cronJob('0 10 16 * * 1-5', () ->
    # ↑のほうで宣言しているsendメソッドを実行する
    send '#nac', "テスト！！"
  ).start()

  # #nacと言う部屋に、平日の16:00時に実行
  new cronJob('0 00 16 * * 1-5', () ->
    send '#nac', "テスト！！"
  ).start()
