
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
    
  # Commands: hubot ヘルプ
  robot.respond /ヘルプ/i, (msg) ->
    msg.reply '
    [H}[ ぬるぽ ] : ｶﾞｯ\n
    [R}[ そのまま返す ] : そのまま返します。\n
    [R}[ おみくじ ] : おみくじの結果を教えてくれます。\n
    [R}[ dice ] : サイコロを振ってくれます。\n
    [R}[ 21 ] : 二課１ＧのポータルサイトＵＲＬをお知らせします。\n
    [H}[ ○○、○○、○○から選ぶ ] : いづれかを選択してくれます。\n
    [R}[ image (検索文字列) ] : (検索文字列)で画像検索をします。\n
    [R}[ wreport ] : 指定の文字列で画像検索をします。\n
    [R}[ mreport ] : 指定の文字列で画像検索をします。\n
    '