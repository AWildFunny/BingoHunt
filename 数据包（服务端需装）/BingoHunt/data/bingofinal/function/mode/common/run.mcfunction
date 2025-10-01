# common 模式入口：检测玩家数 → 分配槽位 → 按槽位放置基地/设置出生点/传送
# 复用 3_dual 的随机挑选与放置思路

 tellraw @a {"text":"[common] run begin","color":"yellow"}

# 准备计分板与标签
scoreboard objectives add bf.index dummy
scoreboard objectives add bf.tmp dummy
# 清理旧槽位与标签
scoreboard players reset @a bf.index
 tag @a remove bf.assigned
 tag @a remove bf.unassigned
 tag @a add bf.unassigned

# 随机为玩家分配槽位（最多 5 槽：0..4）
# 槽位0
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 0
 execute as @a[scores={bf.index=0},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位1
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 1
 execute as @a[scores={bf.index=1},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位2
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 2
 execute as @a[scores={bf.index=2},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位3
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 3
 execute as @a[scores={bf.index=3},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位4
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 4
 execute as @a[scores={bf.index=4},tag=bf.unassigned] run tag @s remove bf.unassigned

# 放置基地与传送（统一处理各槽位）
function bingofinal:mode/common/place_all

# 自动发牌：统计已绑定（bf.index=0..）的玩家数并调用对应分队函数
scoreboard players set #need bf.tmp 0
execute as @a[scores={bf.index=0..}] run scoreboard players add #need bf.tmp 1
execute if score #need bf.tmp matches 3 run function bingofinal:random_team_3
execute if score #need bf.tmp matches 4 run function bingofinal:random_team_4
execute if score #need bf.tmp matches 5 run function bingofinal:random_team_5

tellraw @a {"text":"[common] run end","color":"yellow"} 