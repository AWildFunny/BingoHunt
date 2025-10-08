# 替换玩家的头盔为附魔消失诅咒的皮革头盔
item replace entity @s armor.head with minecraft:leather_helmet[enchantments={vanishing_curse:1}]

# 替换玩家的胸甲为附魔消失诅咒的皮革胸甲
item replace entity @s armor.chest with minecraft:leather_chestplate[enchantments={vanishing_curse:1}]

# 替换玩家的护腿为附魔消失诅咒的皮革护腿
item replace entity @s armor.legs with minecraft:leather_leggings[enchantments={vanishing_curse:1}]

# 替换玩家的靴子为附魔消失诅咒的皮革靴子
item replace entity @s armor.feet with minecraft:leather_boots[enchantments={vanishing_curse:1}]

# 给予玩家附魔消失诅咒的石剑
give @s minecraft:stone_sword[enchantments={vanishing_curse:1}]

# 给予玩家附魔消失诅咒的石斧
give @s minecraft:stone_axe[enchantments={vanishing_curse:1}]

# 给予玩家附魔消失诅咒的石镐
give @s minecraft:stone_pickaxe[enchantments={vanishing_curse:1}]

# 给予玩家附魔消失诅咒的铁锹
give @s minecraft:stone_shovel[enchantments={vanishing_curse:1}]

# 给予玩家16个附魔消失诅咒的面包
give @s minecraft:bread[enchantments={vanishing_curse:1}] 16

# 设置玩家的套件记分板值为0，表示已发放标准套件
scoreboard players set @s selkeepinv_kit 0 
