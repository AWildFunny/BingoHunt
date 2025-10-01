tellraw @a {"text":"circle结算开始","color":"green"}

# 去除所有人的发光效果
effect clear @a minecraft:glowing

# 清除旧的“猎物”和临时“候选”标签
tag @a remove prey
tag @a remove top

# 用假玩家 _max 在目标 score 中保存最大值（初始化为最小整数）
scoreboard players set _max score -2147483648

# 遍历所有玩家，若分数更高则更新最大值
execute as @a run scoreboard players operation _max score > @s score

# 标记所有分数等于最大值的玩家为临时“候选”
execute as @a if score @s score = _max score run tag @s add top

# 在候选中选出唯一“猎物”（并列时任意挑选一名）
execute as @a[tag=top,limit=1,sort=random] run tag @s add prey

# 记录“猎物”的 UUID 到 storage（便于其他函数调用）
execute as @a[tag=prey,limit=1] run data modify storage bingo:state prey_uuid set from entity @s UUID

# 将当前最高分写入 storage，键为 prey_score（便于展示或日志）
execute store result storage bingo:state prey_score int 1 run scoreboard players get _max score

# 清理临时“候选”标签
tag @a remove top

# 为“猎物”添加发光效果
effect give @a[tag=prey] minecraft:glowing 999999 0 true

# 修改猎物的定位条样式
execute as @a run waypoint modify @s style reset
waypoint modify @a[tag=prey,limit=1] style set bowtie

# 播放提示音并广播“猎物”公告（以猎物为位置与名称来源）
execute at @a[tag=prey,limit=1] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
execute as @a[tag=prey,limit=1] run tellraw @a [{"text":"本轮循环结束：","color":"gold"},{"selector":"@s"},{"text":" 成为猎物！","color":"gold"}]

# 轮数 +1
scoreboard players add turn turn 1

# 调试：打印所有玩家的 score
tellraw @a {"text":"[Debug] 各玩家 score：","color":"gray"}
execute as @a run tellraw @a [{"selector":"@s"},{"text":" 的score：","color":"yellow"},{"score":{"name":"@s","objective":"score"},"color":"aqua"}]

# 结尾提示
tellraw @a {"text":"circle结算完毕，重新初始化","color":"green"}


