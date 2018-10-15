
module.exports = (robot) ->
  
  # Commands: ぬるぽ
  robot.hear /ぬるぽ/i, (msg) ->
    msg.send 'ｶﾞｯ'

  # Commands: hubot そのまま返すXXXX
  robot.respond /そのまま返す(.*)/i, (msg) ->
    msg.send "ハロー、 #{msg.match[1]}"

  # Commands: hubot おみくじ
  robot.respond /おみくじ/i, (msg) ->
    msg.reply msg.random ["大吉", "吉", "中吉", "小吉", "末吉", "凶"]
  
  # Commands: hubot dice
  robot.respond /dice/i, (msg) ->
    msg.reply msg.random [
      'https://i.imgur.com/1VWxc1e.jpg',
      'https://i.imgur.com/I1orSk5.jpg',
      'https://i.imgur.com/mF1X0XP.jpg',
      'https://i.imgur.com/w4zBUt8.jpg',
      'https://i.imgur.com/BKkAWG4.jpg',
      'https://i.imgur.com/pZ5qRK6.jpg'
    ]
  
  # Commands: hubot 21
  robot.respond /21/i, (msg) ->
    msg.send "https://script.google.com/macros/s/AKfycbwI7Ye7jN-Fi82zHcXcLG80tDn7n8fcgcCWmiIRnlePe9PgN6Q1/exec"
  
  # Commands: ○○、○○、○○から選ぶ
  robot.hear /(.+)から選ぶ/, (msg) ->
    items = msg.match[1].split(/[　・、\s]+/)
    item  = msg.random items
    msg.reply "#{item}"
    
  # Commands: hubot 21
  robot.respond /オリパラ/i, (msg) ->
    d = new Date
    d1 = new Date "2020-07-24 09:00:00 +0900"
    d2 = new Date "2020-08-25 09:00:00 +0900"
    
    diffOri = datediff d1, d
    diffPara = datediff d2, d
    
    msg.send "オリンピックまで、あと#{diffOri}！\nパラリンピックまで、あと#{diffPara}！"
    
  # Commands: hubot ヘルプ
  robot.respond /ヘルプ/i, (msg) ->
    msg.reply '\n
[H][ ぬるぽ ]\n
     : ｶﾞｯ\n
[R][ そのまま返す XXXX ]\n
     : そのまま返します。\n
[R][ おみくじ ]\n
     : おみくじの結果を教えてくれます。\n
[R][ dice ]\n
     : サイコロを振ってくれます。\n
[R][ 21 ]\n
     : 二課１ＧのポータルサイトＵＲＬをお知らせします。\n
[H][ ○○、○○、○○から選ぶ ]\n
     : いづれかを選択してくれます。\n
[R][ talk XXXXXXXXX ]\n
     : ユーザーローカル人工知能ボットAPIに話しかけます。\n
[R][ img (検索文字列) ]\n
     : (検索文字列)で画像検索をします。\n
[R][ animate (検索文字列) ]\n
     : (検索文字列)でGIF画像検索をします。\n
[R][ map (場所) ]\n
     : (場所)の地図を表示します。\n
[R][ wreport ]\n
     : 週報の提出状況を表示します。\n
[R][ mreport ]\n
     : 月報の提出状況を表示します。\n
[R][ start pomodoro (分) ]\n
     : 指定時間の経過を教えてくれます。\n
[R][ オリパラ ]\n
     : オリンピックまでの残り日数を教えてくれます。\n
[R][ 修造 ]\n
     : 修造のお言葉。\n
[R][ グループ ]\n
     : カンマ区切りの文字列を指定の個数毎にグループ分けしてくれます。\n\n
     
Source : https://github.com/tkn-sep/mako_bot
\n
    '
  
# 日付の差分を取得する関数
datediff = (d1, d) ->
  diff = d1.getTime() - d.getTime()
  days = parseInt(diff/(24*60*60*1000), 10)
  diff -= days * 24 * 60 * 60 * 1000
  hours = parseInt(diff/(60*60*1000), 10)
  diff -= hours * 60 * 60 * 1000
  minutes = parseInt(diff/(60*1000), 10)
  return "#{days}日#{hours}時間#{minutes}分"