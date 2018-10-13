# Commands:
#  hubot グループ

Conversation = require('hubot-conversation');

class GroupList
    member = ""
    num = 0
        
module.exports = (robot) ->

    conversation = new Conversation(robot)
    
    robot.respond /グループ/i, (msg) ->
    
        # 対話の有効時間を設定（タイムアウト時間指定：xx ms）
        dialog = conversation.startDialog msg, 120000; # timeout = 2min
        dialog.timeout = (msg) ->
            msg.emote('タイムアウトしました。')
            
        # 対話開始
        input_member msg, dialog
        
    # 対話ダイアログ
    
    g = new GroupList
    
    trim_input = (str) -> str.trim()
    
    # メンバーの入力
    input_member = (msg, dialog) ->
        msg.send 'グループ分けする要素をカンマ区切りで入力してください\n [ 例) ○○,××,△△ ]'
        #dialog.addChoice /^.*? (.*)/i, (msg2) -> 
        dialog.addChoice /(.*)/i, (msg2) -> 
            g.member = trim_input msg2.match[1]
            g.member = g.member.replace(///#{robot.adapter.self.name} ///, "")
            input_num msg2, dialog # 次に実行する関数をaddChoice内で呼びます
    
    # 幅パラメータの入力
    input_num = (msg, dialog) ->
        msg.send '1グループの人数を入力してください [ 半角数字を入力 ]'
        dialog.addChoice /(.*)/i, (msg2) -> 
            g.num = trim_input msg2.match[1]
            g.num = g.num.replace(///#{robot.adapter.self.name} ///, "")
            show_result msg2, dialog

    # 結果表示
    show_result = (msg, dialog) ->
        members = g.member.split(/[　・、,]+/)
        shuffle members
        cnt = members.length / g.num
        
        for i in [0...cnt]
            collection = for j in [0...g.num]
                members.shift()
            msg.send "-- 第#{i+1}グループ ----\n#{collection.join("\n")}"
    
    # arrayをシャッフルする関数
    shuffle = (array) ->
        i = array.length
        if i is 0 then return false
        while --i
            j = Math.floor Math.random() * (i + 1)
            tmpi = array[i]
            tmpj = array[j]
            array[i] = tmpj
            array[j] = tmpi
        return