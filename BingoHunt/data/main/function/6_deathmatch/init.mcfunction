
# 停止 detect 循环并关闭 playing
scoreboard players set global playing 0
schedule clear main:4_on_playing/tick/_tick

# 停止 circle 计时循环
schedule clear main:4_on_playing/countdown 

# 将所有玩家送入决斗维度（保留原意）
execute as @a run execute in bingofinal:duel run tp @s 22 14 4

# 通用模式：自动分配槽位并放置基地/出生点/传送
function bingofinal:mode/common/run

# 初始化队伍
function main:6_deathmatch/team/init_team

# 货币发放倒计时
# 清理并创建倒计时 Bossbar（10秒）
bossbar remove main:6_deathmatch/countdown
bossbar remove bingofinal:end_timer
bossbar add main:6_deathmatch/countdown {"text":"货币发放倒计时"}
bossbar set main:6_deathmatch/countdown players @a
bossbar set main:6_deathmatch/countdown max 10
bossbar set main:6_deathmatch/countdown value 10
# 准备倒计时计分板
scoreboard objectives add bf.timer dummy
scoreboard players set $dm bf.timer 10

# 初始化开始决战标志为0
scoreboard objectives add dualing dummy
scoreboard players set global dualing 0

# 启动每秒倒计时
schedule function main:6_deathmatch/countdown_tick 1s