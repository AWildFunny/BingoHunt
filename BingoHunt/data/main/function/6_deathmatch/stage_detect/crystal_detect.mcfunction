scoreboard objectives add dual.crystal_count dummy "End Crystals (The End)"

# 初始化：若未加载末地区块则强制加载一次
execute unless score #crystal_loaded dual.crystal_count matches 1 run function main:6_deathmatch/stage_detect/crystal_forceload

scoreboard players set #crystal_total dual.crystal_count 0

# 统计末地水晶总数（限定末地坐标范围 X/Z -50..50，Y -64..136）
execute in minecraft:the_end positioned -50 -64 -50 as @e[type=end_crystal,dx=100,dy=200,dz=100] run scoreboard players add #crystal_total dual.crystal_count 1

# 差值 = 上一刻 - 当前（>0 表示减少）
scoreboard players operation #crystal_diff dual.crystal_count = #crystal_prev dual.crystal_count
scoreboard players operation #crystal_diff dual.crystal_count -= #crystal_total dual.crystal_count

# 若恰好减少 1，则触发回调
execute if score #crystal_diff dual.crystal_count matches 1 run function main:6_deathmatch/stage_detect/on_crystal_destroy

# 更新上一刻的值 = 当前
scoreboard players operation #crystal_prev dual.crystal_count = #crystal_total dual.crystal_count

# title @a actionbar {"text":"末地末影水晶：","color":"yellow","extra":[{"score":{"name":"#crystal_total","objective":"dual.crystal_count"}}]}
# execute as @a run tellraw @s {"text":"检测运行中","color":"gold"}
