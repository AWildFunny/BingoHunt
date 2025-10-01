# 测试函数：发放商店中的所有物品给 ManueldHu
# 基于 shop.txt 中的物品数据

# 雷神之锤
give ManueldHu mace[custom_name='[{"text":"雷神之锤","color":"light_purple","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={wind_burst:3,density:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}] 1

# 破甲之弩
give ManueldHu crossbow[custom_name='[{"text":"破甲之弩","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={piercing:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}] 1

# 诸葛连弩
give ManueldHu crossbow[custom_name='[{"text":"诸葛连弩","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={multishot:1,quick_charge:2},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}] 1

# 海王之叉
give ManueldHu trident[custom_name='[{"text":"海王之叉","color":"light_purple","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={channeling:1,loyalty:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}] 1

# 防弹头盔
give ManueldHu netherite_helmet[custom_name='[{"text":"防弹头盔","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={projectile_protection:5},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:182}] 1

# 龙脊鳞甲
give ManueldHu netherite_chestplate[custom_name='[{"text":"龙脊鳞甲","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:264}] 1

# 疾行护腿
give ManueldHu netherite_leggings[custom_name='[{"text":"疾行护腿","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={swift_sneak:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:248}] 1

# 筋斗足履
give ManueldHu netherite_boots[custom_name='[{"text":"筋斗足履","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={feather_falling:5},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:215}] 1

# 隐身头颅
give ManueldHu player_head[custom_name='[{"text":"隐身头颅","italic":false}]',lore=['[{"text":"戴上后，避免被显示在其他玩家的定位条上","italic":false,"color":"gray"}]'] 1

# 逐风之翼
give ManueldHu elytra[custom_name='[{"text":"逐风之翼","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={vanishing_curse:1},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:216}] 1

# 不死图腾
give ManueldHu totem_of_undying 1

tellraw ManueldHu [{"text":"[神器商店] ","color":"gold","bold":true},{"text":"所有商店物品已发放完成！","color":"green"}] 