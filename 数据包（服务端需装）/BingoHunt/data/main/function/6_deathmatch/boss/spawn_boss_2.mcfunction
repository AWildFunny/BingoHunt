# 确保存在用于轮转的计分板目标（若已存在会忽略）
scoreboard objectives add spawn_cycle dummy
# 初始化全局轮转计数器，防止首次调用不命中分支
execute unless score #end_spawn_cycle spawn_cycle matches 0..3 run scoreboard players set #end_spawn_cycle spawn_cycle 0

# 在末地四个点位之一召唤末影人Boss（固定高程Y=83），并打上临时标签boss_new用于施加初始效果
# 情况0：点位(60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 0 run execute in minecraft:the_end run summon minecraft:enderman 60 83 0 {carriedBlockState:{Name:"minecraft:purple_glazed_terracotta"},CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:150.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],Attributes:[{Name:"minecraft:generic.max_health",Base:250.0}]}
# 情况1：点位(-60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 1 run execute in minecraft:the_end run summon minecraft:enderman -60 83 0 {carriedBlockState:{Name:"minecraft:purple_glazed_terracotta"},CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:150.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],Attributes:[{Name:"minecraft:generic.max_health",Base:250.0}]}
# 情况2：点位(0, 83, 60)
execute if score #end_spawn_cycle spawn_cycle matches 2 run execute in minecraft:the_end run summon minecraft:enderman 0 83 60 {carriedBlockState:{Name:"minecraft:purple_glazed_terracotta"},CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:150.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],Attributes:[{Name:"minecraft:generic.max_health",Base:250.0}]}
# 情况3：点位(0, 83, -60)
execute if score #end_spawn_cycle spawn_cycle matches 3 run execute in minecraft:the_end run summon minecraft:enderman 0 83 -60 {carriedBlockState:{Name:"minecraft:purple_glazed_terracotta"},CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:150.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],Attributes:[{Name:"minecraft:generic.max_health",Base:250.0}]}


# 开启定位条waypoint并设置样式与永久抗性（仅作用于最近一次生成的该Boss）
execute in minecraft:the_end as @e[type=minecraft:enderman,tag=boss_new,limit=1,sort=nearest] run attribute @s minecraft:waypoint_transmit_range base set 256
execute in minecraft:the_end as @e[type=minecraft:enderman,tag=boss_new,limit=1,sort=nearest] run waypoint modify @s style set bowtie
execute in minecraft:the_end as @e[type=minecraft:enderman,tag=boss_new,limit=1,sort=nearest] run effect give @s minecraft:resistance 1000000 1 true
# 移除临时标签，防止后续调用误选中
execute in minecraft:the_end as @e[type=minecraft:enderman,tag=boss_new,limit=1,sort=nearest] run tag @s remove boss_new

# 轮转计数器加一并回绕
scoreboard players add #end_spawn_cycle spawn_cycle 1
execute if score #end_spawn_cycle spawn_cycle matches 4.. run scoreboard players set #end_spawn_cycle spawn_cycle 0
