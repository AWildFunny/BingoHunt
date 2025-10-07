# 3_dual 开局：为每位玩家放置基地、设置出生点、随机分配身份并开始游戏
 tellraw @a {"text":"[3_dual] start begin","color":"yellow"}
 title @a actionbar {"text":"[3_dual] 已进入 start()","color":"yellow"}
 # 假设最多3名玩家；如>3，仅随机挑选3名参与
# 结构：data/bingofinal/structures/base1.nbt
 function bingofinal:dual
 tellraw @a {"text":"[3_dual] 启动，正在传送并初始化...","color":"yellow"}

# 标记游戏运行中
scoreboard objectives add bf.role dummy
scoreboard objectives add bf.index dummy
scoreboard objectives add bf.game dummy
scoreboard objectives add bf.lives dummy
scoreboard objectives add bf.deaths dummy
scoreboard objectives add bf.tmp dummy
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
scoreboard players set #game bf.game 1

# 清理并随机挑选最多3名玩家
 tag @a remove bf.assigned
 tag @a remove bf.unassigned
 tag @a add bf.unassigned
 tellraw @a {"text":"[3_dual] 开始随机挑选最多3名参赛者","color":"yellow"}
 # 槽位0
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 0
 execute as @a[scores={bf.index=0}] run tag @s remove bf.unassigned
 # 槽位1
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 1
 execute as @a[scores={bf.index=1}] run tag @s remove bf.unassigned
 # 槽位2
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 2
 execute as @a[scores={bf.index=2}] run tag @s remove bf.unassigned

# 初始化任意死亡基线
execute as @a[scores={bf.index=0..2}] run scoreboard players operation @s bf.deaths_prev = @s bf.deaths_all

# 放置基地（仅对存在该槽位玩家时放置），并设置各自出生点
# 槽位0：基准(0,10,0)  出生=基准+(22,4,4)→(22,14,4)
 execute if entity @a[scores={bf.index=0}] run tellraw @a {"text":"[3_dual] 为槽位0放置 base1 @ (0,10,0)","color":"yellow"}
 execute if entity @a[scores={bf.index=0}] run execute in bingofinal:duel run forceload add -2 -2 2 2
 execute if entity @a[scores={bf.index=0}] run execute in bingofinal:duel run place template bingofinal:base1 0 10 0
 execute if entity @a[scores={bf.index=0}] run tellraw @a {"text":"[3_dual] 槽位0：已尝试放置 base1","color":"yellow"}
 execute as @a[scores={bf.index=0}] in bingofinal:duel run spawnpoint @s 22 14 4
 execute if entity @a[scores={bf.index=0}] run execute in bingofinal:duel run forceload remove -2 -2 2 2
# 槽位1：基准(100,10,0) 出生=(122,14,4)
 execute if entity @a[scores={bf.index=1}] run tellraw @a {"text":"[3_dual] 为槽位1放置 base1 @ (100,10,0)","color":"yellow"}
 execute if entity @a[scores={bf.index=1}] run execute in bingofinal:duel run forceload add 4 -2 8 2
 execute if entity @a[scores={bf.index=1}] run execute in bingofinal:duel run place template bingofinal:base1 100 10 0
 execute if entity @a[scores={bf.index=1}] run tellraw @a {"text":"[3_dual] 槽位1：已尝试放置 base1","color":"yellow"}
 execute as @a[scores={bf.index=1}] in bingofinal:duel run spawnpoint @s 122 14 4
 execute if entity @a[scores={bf.index=1}] run execute in bingofinal:duel run forceload remove 4 -2 8 2
# 槽位2：基准(0,10,100) 出生=(22,14,104)
 execute if entity @a[scores={bf.index=2}] run tellraw @a {"text":"[3_dual] 为槽位2放置 base1 @ (0,10,100)","color":"yellow"}
 execute if entity @a[scores={bf.index=2}] run execute in bingofinal:duel run forceload add -2 4 2 8
 execute if entity @a[scores={bf.index=2}] run execute in bingofinal:duel run place template bingofinal:base1 0 10 100
 execute if entity @a[scores={bf.index=2}] run tellraw @a {"text":"[3_dual] 槽位2：已尝试放置 base1","color":"yellow"}
 execute as @a[scores={bf.index=2}] in bingofinal:duel run spawnpoint @s 22 14 104
 execute if entity @a[scores={bf.index=2}] run execute in bingofinal:duel run forceload remove -2 4 2 8

# 传送参赛玩家到各自出生点
 execute as @a[scores={bf.index=0}] run execute in bingofinal:duel run tp @s 22 14 4
 execute as @a[scores={bf.index=1}] run execute in bingofinal:duel run tp @s 122 14 4
 execute as @a[scores={bf.index=2}] run execute in bingofinal:duel run tp @s 22 14 104

# 随机分配身份（1=猎人，2=猎物），保证双方至少各1人
 scoreboard players set #hun bf.tmp 0
 scoreboard players set #prey bf.tmp 0
 # 初始默认全员设为猎人
 scoreboard players set @a[scores={bf.index=0..2}] bf.role 1
 # 为每位参赛者投硬币，若为1则改为猎物
 execute as @a[scores={bf.index=0..2}] store result score @s bf.tmp run random value 0 1
 execute as @a[scores={bf.index=0..2},scores={bf.tmp=1}] run scoreboard players set @s bf.role 2
 # 统计数量
 scoreboard players set #hun bf.tmp 0
 execute as @a[scores={bf.index=0..2},scores={bf.role=1}] run scoreboard players add #hun bf.tmp 1
 scoreboard players set #prey bf.tmp 0
 execute as @a[scores={bf.index=0..2},scores={bf.role=2}] run scoreboard players add #prey bf.tmp 1
 # 确保至少一个猎物
 execute if score #prey bf.tmp matches 0 run execute as @a[scores={bf.index=0..2},limit=1,sort=random] run scoreboard players set @s bf.role 2
 # 重新统计，确保至少一个猎人
 scoreboard players set #hun bf.tmp 0
 execute as @a[scores={bf.index=0..2},scores={bf.role=1}] run scoreboard players add #hun bf.tmp 1
 execute if score #hun bf.tmp matches 0 run execute as @a[scores={bf.index=0..2},limit=1,sort=random] run scoreboard players set @s bf.role 1

# 重置生命计数与阶段死亡计数（仅猎物会在“仅剩1名”时获得3条命）
 scoreboard players set @a[scores={bf.index=0..2}] bf.lives 0
 scoreboard players set @a[scores={bf.index=0..2}] bf.deaths 0

# 展示身份标题
 title @a[scores={bf.index=0..2},scores={bf.role=1}] title {"text":"你的身份是：猎人","color":"red","bold":true}
 title @a[scores={bf.index=0..2},scores={bf.role=1}] subtitle {"text":"游戏目标：击杀全部猎物","color":"gray"}
 title @a[scores={bf.index=0..2},scores={bf.role=2}] title {"text":"你的身份是：猎物","color":"green","bold":true}
 title @a[scores={bf.index=0..2},scores={bf.role=2}] subtitle {"text":"游戏目标：击杀末影龙","color":"gray"}

# 如未存在末影龙则召唤一只
 execute in bingofinal:duel unless entity @e[type=ender_dragon,limit=1] run summon ender_dragon 0 80 0
 tellraw @a {"text":"[BingoFinal] 3_dual 模式已开始。","color":"gold"} 