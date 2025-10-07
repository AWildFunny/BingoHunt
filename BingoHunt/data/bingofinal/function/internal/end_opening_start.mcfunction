# 首位玩家进入末地时触发（仅在游戏进行中由 tick 调用）
# 行为：广播标题、副标题、龙吼；创建90秒Bossbar并开始每秒倒计时

# 计分板与标志
scoreboard objectives add bf.flag dummy
scoreboard objectives add bf.timer dummy

# 标记“末地开场已触发”
scoreboard players set #end_started bf.flag 1

# 标题与音效
 title @a title {"text":"决战开启","color":"gold","bold":true}
 title @a subtitle {"text":"第一位玩家已进入末地","color":"gray"}
 playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 1

# Bossbar 初始化
bossbar add bingofinal:end_timer {"text":"90秒后其他玩家可进入"}
bossbar set bingofinal:end_timer players @a
bossbar set bingofinal:end_timer color purple
bossbar set bingofinal:end_timer max 90
scoreboard players set #end_timer bf.timer 90
execute store result bossbar bingofinal:end_timer value run scoreboard players get #end_timer bf.timer
bossbar set bingofinal:end_timer name {"text":"","extra":[{"score":{"name":"#end_timer","objective":"bf.timer"}},{"text":"秒后其他玩家可进入","color":"gray"}]}

# 启动1秒节拍倒计时
schedule function bingofinal:internal/end_opening_countdown 1s replace 