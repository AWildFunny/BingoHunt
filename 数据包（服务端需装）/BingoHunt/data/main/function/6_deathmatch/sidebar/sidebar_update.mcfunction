execute as @a[tag=prey] run scoreboard players set @s order 7
execute as @a[tag=prey] run scoreboard players display name @s order {text:"当前猎物：",extra:[{selector:"@s"}]}


# # 确保工作用目标存在
# scoreboard objectives add dm.sidebar dummy
# scoreboard objectives add dm.base dummy
# scoreboard objectives add dm.work dummy
# scoreboard objectives add var dummy
# scoreboard objectives add dual.crystal_count dummy

# # 统计：终末母体数量（Shulker/Enderman）
# scoreboard players set #boss_num var 0
# execute as @e[tag=boss_shulker] run scoreboard players add #boss_num var 1
# execute as @e[tag=boss_enderman,tag=!boss_shulker] run scoreboard players add #boss_num var 1

# # 统计：猎物/猎人/卧底人数
# scoreboard players set #prey dm.work 0
# execute as @a[tag=prey] run scoreboard players add #prey dm.work 1

# scoreboard players set #undercover dm.work 0
# execute as @a[tag=undercover] run scoreboard players add #undercover dm.work 1

# scoreboard players set #hunter dm.work 0
# execute as @a[tag=!prey,tag=!undercover] run scoreboard players add #hunter dm.work 1

# # 动态阶段名（1=摧毁水晶，2=终末母体阶段，其他=进行中）
# execute if score global dual_stage matches 1 run data modify entity @e[type=marker,tag=dm_sb_line_stage,limit=1,sort=nearest] CustomName set value {"text":"当前阶段：摧毁末地水晶","bold":true,"color":"gold","font":"minecraft:uniform"}
# execute if score global dual_stage matches 2 run data modify entity @e[type=marker,tag=dm_sb_line_stage,limit=1,sort=nearest] CustomName set value {"text":"当前阶段：终末母体","bold":true,"color":"gold","font":"minecraft:uniform"}
# execute unless score global dual_stage matches 1..2 run data modify entity @e[type=marker,tag=dm_sb_line_stage,limit=1,sort=nearest] CustomName set value {"text":"当前阶段：进行中","bold":true,"color":"gold","font":"minecraft:uniform"}

# # 动态身份与目标行（基于玩家自身身份；这里只设置行标题，具体个人身份通过下方数值行呈现）
# # 身份与目标为静态标题，无需每tick改名；如需个性化可做 per-player sidebar，但 vanilla 仅支持全局侧边栏

# # 重置所有行到基础权重
# execute as @e[type=marker,tag=dm_sb] run scoreboard players operation @s dm.sidebar = @s dm.base

# # 叠加动态值（保证行顺序不变的同时显示数值）
# execute as @e[type=marker,tag=dm_sb_line_stage,limit=1] run scoreboard players operation @s dm.sidebar += global dual_stage
# execute as @e[type=marker,tag=dm_sb_line_crystals,limit=1] run scoreboard players operation @s dm.sidebar += #crystal_total dual.crystal_count
# execute as @e[type=marker,tag=dm_sb_line_boss,limit=1] run scoreboard players operation @s dm.sidebar += #boss_num var
# execute as @e[type=marker,tag=dm_sb_line_prey,limit=1] run scoreboard players operation @s dm.sidebar += #prey dm.work
# execute as @e[type=marker,tag=dm_sb_line_hunters,limit=1] run scoreboard players operation @s dm.sidebar += #hunter dm.work
# execute as @e[type=marker,tag=dm_sb_line_undercover,limit=1] run scoreboard players operation @s dm.sidebar += #undercover dm.work

# # 持续为所有玩家设置侧边栏显示（容错：新加入玩家）
# execute as @a run scoreboard objectives setdisplay sidebar dm.sidebar
