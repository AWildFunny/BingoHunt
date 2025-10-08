# 从玩家库存中提取指定槽位的物品数据到存储
$data modify storage selkeepinv:storage g.item set from entity @s Inventory[$(Itemnum)]

# 移除物品的槽位信息，避免生成时冲突
data remove storage selkeepinv:storage g.item.Slot

# 检查当前物品是否含有消失诅咒附魔，如果没有则继续掉落流程
execute unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_inventory_process with storage selkeepinv:storage g

# 减少剩余物品计数
scoreboard players remove Count selkeepinv 1

# 将剩余物品槽位号更新到记分板
execute store result score Itemnum selkeepinv run data get storage selkeepinv:storage g.Itemnum

# 减少下一个物品槽位号
scoreboard players remove Itemnum selkeepinv 1

# 更新存储中的下一个物品槽位号
execute store result storage selkeepinv:storage g.Itemnum int 1 run scoreboard players get Itemnum selkeepinv

# 生成新的随机旋转角度（0-360度）
execute store result storage selkeepinv:storage g.random float 1 run random value 0..360

# 生成新的随机投掷距离（基于1-100的随机值，乘以0.005）
execute store result storage selkeepinv:storage g.power float 0.005 run random value 1..100

# 如果还有剩余物品，递归调用本函数处理下一个物品
execute if score Count selkeepinv matches 1.. run function selkeepinv:drop_inventory with storage selkeepinv:storage g
