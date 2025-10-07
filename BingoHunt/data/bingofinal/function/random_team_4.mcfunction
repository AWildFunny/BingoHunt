# 随机分队（4人决战）——手动调用入口
# 用法：/function bingofinal:random_team_4

tellraw @a {"text":"[BingoFinal] random_team_4 begin","color":"yellow"}

# 若游戏已开始，也允许重分配（不退出）
execute if score #game bf.game matches 1 run tellraw @a {"text":"[BingoFinal] 对局进行中：重新分配身份与命数。","color":"gold"}

# 确保计分板存在
scoreboard objectives add bf.role dummy
scoreboard objectives add bf.index dummy
scoreboard objectives add bf.game dummy
scoreboard objectives add bf.lives dummy
scoreboard objectives add bf.deaths dummy
scoreboard objectives add bf.tmp dummy
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy

# 统计参赛者数量（index=0..3）
scoreboard players set #need bf.tmp 0
execute as @a[scores={bf.index=0}] run scoreboard players add #need bf.tmp 1
execute as @a[scores={bf.index=1}] run scoreboard players add #need bf.tmp 1
execute as @a[scores={bf.index=2}] run scoreboard players add #need bf.tmp 1
execute as @a[scores={bf.index=3}] run scoreboard players add #need bf.tmp 1
execute if score #need bf.tmp matches 0 run tellraw @a {"text":"[BingoFinal] 未检测到参赛玩家（bf.index 未设置）。","color":"red"}
execute if score #need bf.tmp matches 0 run return 0

# 将当前总死亡数作为初始基线
execute as @a[scores={bf.index=0..3}] run scoreboard players operation @s bf.deaths_prev = @s bf.deaths_all

# 清零历史角色与生命
scoreboard players reset @a bf.role
scoreboard players set @a[scores={bf.index=0..3}] bf.lives 0
scoreboard players set @a[scores={bf.index=0..3}] bf.deaths 0

# 默认全为猎人(1)，然后 50% 概率改为猎物(2)
scoreboard players set @a[scores={bf.index=0..3}] bf.role 1
scoreboard objectives add bf.rand dummy
execute as @a[scores={bf.index=0..3}] store result score @s bf.rand run random value 0..1
execute as @a[scores={bf.index=0..3}] if score @s bf.rand matches 1 run scoreboard players set @s bf.role 2

# 确保至少一猎物与一猎人（兜底）
scoreboard players set #prey bf.tmp 0
execute as @a[scores={bf.index=0..3,bf.role=2}] run scoreboard players add #prey bf.tmp 1
execute if score #prey bf.tmp matches 0 as @a[scores={bf.index=0..3},limit=1,sort=random] run scoreboard players set @s bf.role 2
scoreboard players set #hun bf.tmp 0
execute as @a[scores={bf.index=0..3,bf.role=1}] run scoreboard players add #hun bf.tmp 1
execute if score #hun bf.tmp matches 0 as @a[scores={bf.index=0..3},limit=1,sort=random] run scoreboard players set @s bf.role 1

# 强制平衡为 2 猎人 + 2 猎物
scoreboard players set #hun bf.tmp 0
execute as @a[scores={bf.index=0..3,bf.role=1}] run scoreboard players add #hun bf.tmp 1
# 情况：4 猎人 0 猎物 → 转 2 名为猎物
execute if score #hun bf.tmp matches 4 run execute as @a[scores={bf.index=0..3,bf.role=1},limit=2,sort=random] run scoreboard players set @s bf.role 2
# 情况：3 猎人 1 猎物 → 转 1 名为猎物
execute if score #hun bf.tmp matches 3 run execute as @a[scores={bf.index=0..3,bf.role=1},limit=1,sort=random] run scoreboard players set @s bf.role 2
# 情况：1 猎人 3 猎物 → 转 1 名为猎人
execute if score #hun bf.tmp matches 1 run execute as @a[scores={bf.index=0..3,bf.role=2},limit=1,sort=random] run scoreboard players set @s bf.role 1
# 情况：0 猎人 4 猎物 → 转 2 名为猎人
execute if score #hun bf.tmp matches 0 run execute as @a[scores={bf.index=0..3,bf.role=2},limit=2,sort=random] run scoreboard players set @s bf.role 1

# 设置游戏标志为进行中（tick 才会生效）
scoreboard players set #game bf.game 1

# 展示身份标题
# title @a[scores={bf.index=0..2,bf.role=1}] title {"text":"你的身份是：猎人","color":"red","bold":true}
# title @a[scores={bf.index=0..2,bf.role=1}] subtitle {"text":"游戏目标：击杀全部猎物","color":"gray"}
# title @a[scores={bf.index=0..2,bf.role=2}] title {"text":"你的身份是：猎物","color":"green","bold":true}
# title @a[scores={bf.index=0..2,bf.role=2}] subtitle {"text":"游戏目标：击杀末影龙","color":"gray"}

# 打印分队结果
execute as @a[scores={bf.index=0..3,bf.role=1}] run tellraw @a {"text":"[猎人] ","color":"red","extra":[{"selector":"@s"}]}
execute as @a[scores={bf.index=0..3,bf.role=2}] run tellraw @a {"text":"[猎物] ","color":"green","extra":[{"selector":"@s"}]}

# 结束提示
tellraw @a {"text":"[BingoFinal] 4人分队完成，游戏开始！","color":"gold"} 