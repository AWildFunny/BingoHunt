# 确保存在用于轮转的计分板目标（若已存在会忽略）
scoreboard objectives add spawn_cycle dummy
# 初始化全局轮转计数器，防止首次调用不命中分支
execute unless score #end_spawn_cycle spawn_cycle matches 0..3 run scoreboard players set #end_spawn_cycle spawn_cycle 0

# 1：生成潜影贝boss
# 在末地四个点位之一召唤Boss（固定高程Y=83），并打上临时标签boss_new用于着陆处理（CustomName 使用 SNBT 文本组件格式，支持十六进制颜色与加粗）
# 情况0：点位(60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 0 run execute in minecraft:the_end run summon minecraft:shulker 60 83 0 {Color:10,CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:100.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],attributes:[{id:"max_health",base:200.0}],Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}
# 情况1：点位(-60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 1 run execute in minecraft:the_end run summon minecraft:shulker -60 83 0 {Color:10,CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:100.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],attributes:[{id:"max_health",base:200.0}],Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}
# 情况2：点位(0, 83, 60)
execute if score #end_spawn_cycle spawn_cycle matches 2 run execute in minecraft:the_end run summon minecraft:shulker 0 83 60 {Color:10,CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:100.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],attributes:[{id:"max_health",base:200.0}],Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}
# 情况3：点位(0, 83, -60)
execute if score #end_spawn_cycle spawn_cycle matches 3 run execute in minecraft:the_end run summon minecraft:shulker 0 83 -60 {Color:10,CustomName:{text:"终末母体",bold:true,color:"#9900cc"},CustomNameVisible:1b,Health:100.0f,Glowing:1b,PersistenceRequired:1b,Tags:["boss","boss_new"],attributes:[{id:"max_health",base:200.0}],Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}

# 让新生成的Boss逐级下落直到脚下非空气（重复足够次数覆盖83->地表落差）；仅作用于最近一次生成者
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] at @s if block ~ ~-1 ~ minecraft:air run tp @s ~ ~-1 ~
# 开启定位条waypoint并设置样式与永久抗性（仅作用于最近一次生成的该Boss）
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] run attribute @s minecraft:waypoint_transmit_range base set 256
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] run waypoint modify @s style set bowtie
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] run effect give @s minecraft:resistance 1000000 1 true
# 移除临时标签，防止后续调用误选中
execute in minecraft:the_end as @e[type=minecraft:shulker,tag=boss_new,limit=1,sort=nearest] run tag @s remove boss_new

# 轮转计数器加一并回绕
scoreboard players add #end_spawn_cycle spawn_cycle 1
execute if score #end_spawn_cycle spawn_cycle matches 4.. run scoreboard players set #end_spawn_cycle spawn_cycle 0