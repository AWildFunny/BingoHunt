# 获取玩家库存中物品的数量，作为循环计数
execute store result score Count selkeepinv run data get entity @s Inventory

# 初始化存储中的物品槽位号为0
data modify storage selkeepinv:storage g.Itemnum set value 0

# 生成初始随机旋转角度（0-360度）
execute store result storage selkeepinv:storage g.random float 1 run random value 0..360

# 生成初始随机投掷距离（0-100 * 0.005）
execute store result storage selkeepinv:storage g.power float 0.005 run random value 0..100

# 处理装备栏物品 - 头盔
execute if data entity @s equipment.head run data modify storage selkeepinv:storage g.item set from entity @s equipment.head
# 检查头盔是否含有消失诅咒附魔，如果没有则掉落
execute if data entity @s equipment.head unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_item with storage selkeepinv:storage g
# 处理装备栏物品 - 胸甲
execute if data entity @s equipment.chest run data modify storage selkeepinv:storage g.item set from entity @s equipment.chest
# 检查胸甲是否含有消失诅咒附魔，如果没有则掉落
execute if data entity @s equipment.chest unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_item with storage selkeepinv:storage g
# 处理装备栏物品 - 护腿
execute if data entity @s equipment.legs run data modify storage selkeepinv:storage g.item set from entity @s equipment.legs
# 检查护腿是否含有消失诅咒附魔，如果没有则掉落
execute if data entity @s equipment.legs unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_item with storage selkeepinv:storage g
# 处理装备栏物品 - 靴子
execute if data entity @s equipment.feet run data modify storage selkeepinv:storage g.item set from entity @s equipment.feet
# 检查靴子是否含有消失诅咒附魔，如果没有则掉落
execute if data entity @s equipment.feet unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_item with storage selkeepinv:storage g
# 处理装备栏物品 - 副手
execute if data entity @s equipment.offhand run data modify storage selkeepinv:storage g.item set from entity @s equipment.offhand
# 检查副手物品是否含有消失诅咒附魔，如果没有则掉落
execute if data entity @s equipment.offhand unless data storage selkeepinv:storage g.item.tag.Enchantments[{id:"minecraft:vanishing_curse"}] run function selkeepinv:drop_item with storage selkeepinv:storage g

# 调用drop_inventory函数，开始丢弃所有库存物品
function selkeepinv:drop_inventory with storage selkeepinv:storage g

# 清空玩家的所有物品
clear @s