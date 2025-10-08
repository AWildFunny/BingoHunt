# 测试函数：直接使用give命令向指定玩家ManueldHu发放所有商店物品，基于shop.txt数据，兼容MC 1.21.6的NBT格式

# 给予雷神之锤：狼牙棒，附带风爆发III和致密III附魔，自定义数据
give ManueldHu mace[custom_name='[{"text":"雷神之锤","color":"light_purple","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={wind_burst:3,density:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}] 1

# 给予破甲之弩：弩，附带穿透III附魔，自定义数据
give ManueldHu crossbow[custom_name='[{"text":"破甲之弩","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={piercing:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}] 1

# 给予诸葛连弩：弩，附带多重射击I和快速装填II附魔，自定义数据
give ManueldHu crossbow[custom_name='[{"text":"诸葛连弩","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={multishot:1,quick_charge:2},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}] 1

# 给予海王之叉：三叉戟，附带导引I和忠诚III附魔，自定义数据
give ManueldHu trident[custom_name='[{"text":"海王之叉","color":"light_purple","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={channeling:1,loyalty:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}] 1

# 给予防弹头盔：下界合金头盔，附带弹射物防护V附魔，自定义数据
give ManueldHu netherite_helmet[custom_name='[{"text":"防弹头盔","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={projectile_protection:5},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:182}] 1

# 给予龙脊鳞甲：下界合金胸甲，无附魔，自定义数据
give ManueldHu netherite_chestplate[custom_name='[{"text":"龙脊鳞甲","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:264}] 1

# 给予疾行护腿：下界合金护腿，附带迅捷潜行III附魔，自定义数据
give ManueldHu netherite_leggings[custom_name='[{"text":"疾行护腿","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={swift_sneak:3},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:248}] 1

# 给予筋斗足履：下界合金靴子，附带摔落防护V附魔，自定义数据
give ManueldHu netherite_boots[custom_name='[{"text":"筋斗足履","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={feather_falling:5},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:215}] 1

# 给予隐身头颅：玩家头颅，自定义名称和描述（无自定义数据）
give ManueldHu player_head[custom_name='[{"text":"隐身头颅","italic":false}]',lore=['[{"text":"戴上后，避免被显示在其他玩家的定位条上","italic":false,"color":"gray"}]'] 1

# 给予逐风之翼：鞘翅，附带消失诅咒I，自定义数据
give ManueldHu elytra[custom_name='[{"text":"逐风之翼","color":"aqua","italic":false}]',lore=['[{"text":"死亡后不掉落，复活返还","color":"gold","italic":false}]','[{"text":"每次死亡耐久减半（2次后消失）","color":"gray","italic":false}]'],enchantments={vanishing_curse:1},custom_data={selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:216}] 1

# 给予不死图腾：简单的不死图腾，无自定义
give ManueldHu totem_of_undying 1

# 向ManueldHu发送完成消息
tellraw ManueldHu [{"text":"[神器商店] ","color":"gold","bold":true},{"text":"所有商店物品已发放完成！","color":"green"}] 