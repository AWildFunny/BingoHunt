tellraw @a {"text":"[Bingo] 阶段：on_postgame","color":"red"}

# 停止 detect 循环并关闭 playing
scoreboard players set global playing 0
schedule clear main:4_on_playing/tick/_tick

# 停止 circle 计时循环
schedule clear main:4_on_playing/countdown 

# 清除旧的“猎物”和临时“候选”标签
tag @a remove prey
tag @a remove top

# 重置定位条样式
execute as @a run waypoint modify @s style reset

# 移除边界
function main:4_on_playing/worldborder/remove

# 显示积分排行榜
function main:5_on_postgame/scoreboard/sidebar_init