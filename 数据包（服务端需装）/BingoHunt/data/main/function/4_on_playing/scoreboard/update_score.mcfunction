# 基于差值的同步：当玩家“物品(bingo_items)”增加多少，总分 score 同步增加多少
# 需要以下计分板：
# - bingo_items 玩家个人“物品”计数
# - score 总分
# - items_prev（dummy） 记录上次已同步的“物品”数
# - items_delta（dummy） 临时差值

# ===== 调试：初始值快照 =====
# execute as @a run tellraw @a [{"text":"[update_score] 目标：","color":"gray"},{"selector":"@s","color":"white"},{"text":" bingo_items=","color":"gray"},{"score":{"name":"@s","objective":"bingo_items"},"color":"aqua"},{"text":" items_prev=","color":"gray"},{"score":{"name":"@s","objective":"items_prev"},"color":"yellow"},{"text":" score=","color":"gray"},{"score":{"name":"@s","objective":"score"},"color":"green"}]

# 计算各玩家本次差值：delta = bingo_items - items_prev
execute as @a run scoreboard players operation @s items_delta = @s bingo_items
execute as @a run scoreboard players operation @s items_delta -= @s items_prev
# 调试：打印 delta
# execute as @a run tellraw @a [{"text":"[update_score] ","color":"gray"},{"selector":"@s"},{"text":" delta=","color":"gray"},{"score":{"name":"@s","objective":"items_delta"},"color":"gold"}]

# 仅当差值为正时，同步到总分并更新上次值
execute as @a if score @s items_delta matches 1.. run scoreboard players operation @s score += @s items_delta
# execute as @a if score @s items_delta matches 1.. run tellraw @a [{"text":"[update_score] ","color":"gray"},{"selector":"@s"},{"text":" score+=","color":"gray"},{"score":{"name":"@s","objective":"items_delta"},"color":"gold"},{"text":" -> score=","color":"gray"},{"score":{"name":"@s","objective":"score"},"color":"green"}]
execute as @a if score @s items_delta matches 1.. run scoreboard players operation @s items_prev = @s bingo_items
# execute as @a if score @s items_delta matches 1.. run tellraw @a [{"text":"[update_score] ","color":"gray"},{"selector":"@s"},{"text":" items_prev:=bingo_items -> ","color":"gray"},{"score":{"name":"@s","objective":"items_prev"},"color":"yellow"}]

# 当无正增量时的调试输出
# execute as @a unless score @s items_delta matches 1.. run tellraw @a [{"text":"[update_score] ","color":"gray"},{"selector":"@s"},{"text":" 无增量（不变更）","color":"dark_gray"}]
