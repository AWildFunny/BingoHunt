tellraw @a {"text":"[Bingo] 阶段：on_pregame","color":"gold"} 
# 清理后续阶段遗留的计划任务
schedule clear main:4_on_playing/tick/_tick
schedule clear main:4_on_playing/countdown

# 清理标签与状态效果/样式
tag @a remove prey
tag @a remove top
effect clear @a minecraft:glowing
waypoint modify @a style reset

# 清除 storage 中的临时数据
data remove storage bingo:state prey_uuid
data remove storage bingo:state prey_score

# 移除在 on_playing 阶段创建的计分板与变量
scoreboard objectives remove circle_time
scoreboard objectives remove turn
scoreboard objectives remove items_prev
scoreboard objectives remove items_delta
scoreboard objectives remove hp_calc
scoreboard objectives remove playing

# 移除在倒计时显示中使用的侧边栏
scoreboard objectives setdisplay sidebar
scoreboard objectives remove bh_ui

# 重置所有玩家的总分为 0
scoreboard players set @a score 0 

# 清理残留bossbar
bossbar remove main:circle_time
bossbar remove main:6_deathmatch/countdown2