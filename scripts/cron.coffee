# 定期処理をするオブジェクトを宣言
cronJob = require('cron').CronJob


module.exports = (robot) ->

  # 特定のチャンネルへ送信するメソッド(定期実行時に呼ばれる)　
  send = (channel, msg) ->
    robot.send {room: channel}, msg

  # Crontabの設定方法と基本一緒 *(sec) *(min) *(hour) *(day) *(month) *(day of the week)
  # #nacと言う部屋に、平日の17:30時に実行
  new cronJob('0 20 16 * * 1-5', () ->
    # ↑のほうで宣言しているsendメソッドを実行する
    var myArray = ['森下君', '佐藤君', '肥田君', '中谷君', '植木君', '永井君'];
    var rand = Math.floor(Math.random()*myArray.length);
    var rValue = myArray[rand];
    send '#nac', rValue
  ).start()

  # #nacと言う部屋に、平日の16:00時に実行
  new cronJob('0 25 16 * * 1-5', () ->
    var myArray = ['森下君', '佐藤君', '肥田君', '中谷君', '植木君', '永井君'];
    var rand = Math.floor(Math.random()*myArray.length);
    var rValue = myArray[rand];
    send '#nac', '今回の司会者は" + rValue + "！！"
  ).start()
