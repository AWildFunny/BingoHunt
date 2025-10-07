# 一次性初始化侧边栏与静态行
scoreboard objectives add bh_ui dummy
scoreboard objectives modify bh_ui displayname {text:"BingoHunt",bold:true}
scoreboard objectives setdisplay sidebar bh_ui
scoreboard objectives modify bh_ui numberformat styled {color:"yellow",font:"minecraft:uniform"}

# 清理旧行
scoreboard players reset * bh_ui

# 使用 ASCII 假玩家名，避免侧栏自动为含空格/非 ASCII 名字加引号
scoreboard players set line.turn bh_ui 0
scoreboard players display name line.turn bh_ui {text:"当前循环次数："}

scoreboard players set line.time bh_ui 0
scoreboard players display name line.time bh_ui {text:"循环剩余时间："}