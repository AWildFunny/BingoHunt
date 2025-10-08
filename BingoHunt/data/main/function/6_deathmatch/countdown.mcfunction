# 将 circle_time 计时减 1（以虚拟玩家 circle 作为存储槽位）
scoreboard players remove circle circle_time 1

# --- 每s更新逻辑 ---
# 更新bossbar，将bossbar的相关参数（max、value）与circle、circle_max同步
function main:6_deathmatch/bossbar/circle_bar

execute if score circle circle_time matches 120 run tellraw @a {"text":"猎物时间剩余：两分钟！","color":"red"}
execute if score circle circle_time matches 120 at @a run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1

execute if score circle circle_time matches 60 run tellraw @a {"text":"猎物时间剩余：最后一分钟！","color":"red"}
execute if score circle circle_time matches 60 at @a run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1

execute if score circle circle_time matches 15 run tellraw @a {"text":"猎物时间剩余：最后十五秒！","color":"red"}
execute if score circle circle_time matches 15 at @a run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 2 1

# --- 判断逻辑 ---
# 水晶全部被摧毁时，更新游戏阶段（仅当仍处于阶段1时触发一次）
execute if score #crystal_total dual.crystal_count matches 0 if score global dual_stage matches 1 run function main:6_deathmatch/stage_detect/change_stage
# 若计时为 0，则调用结算逻辑
execute if score circle circle_time matches 0 run function main:6_deathmatch/decide/hunter_win

# 修改定位条
function main:6_deathmatch/waypoint/init

# 继续在 1 秒后再次执行自身，实现循环计时 
execute if score global dualing matches 1 run schedule function main:6_deathmatch/countdown 1s