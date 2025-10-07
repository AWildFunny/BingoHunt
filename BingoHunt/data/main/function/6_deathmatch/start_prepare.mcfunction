# 展示标题
title @a title {"text":"- 决战准备阶段 -","color":"green","bold":true}
title @a subtitle {"text":"货币已发放，5分钟后开始决战","color":"gray"}

# 决战开始倒计时
# 清理并创建倒计时 Bossbar（300秒）
bossbar remove main:6_deathmatch/countdown
bossbar remove bingofinal:end_timer
bossbar add main:6_deathmatch/countdown2 {"text":"决战开启倒计时"}
bossbar set main:6_deathmatch/countdown2 players @a
bossbar set main:6_deathmatch/countdown2 max 300
bossbar set main:6_deathmatch/countdown2 value 300
# 准备倒计时计分板
scoreboard objectives add bf.timer dummy
scoreboard players set $dm bf.timer 300
# 启动每秒倒计时
schedule function main:6_deathmatch/countdown_tick2 1s

# 准备记分板
function main:6_deathmatch/sidebar/sidebar_init