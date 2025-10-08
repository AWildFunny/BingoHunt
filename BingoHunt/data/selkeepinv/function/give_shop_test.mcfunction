# 神器商店物品测试函数 - 用于测试发放所有商店物品给指定玩家，兼容MC 1.21.6的组件格式

# 雷神之锤：生成带有自定义名称、描述、附魔和自定义数据的狼牙棒物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:mace",count:1,components:{"minecraft:custom_name":{text:"雷神之锤",color:"light_purple",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:wind_burst":3,"minecraft:density":3},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}}}}

# 破甲之弩：生成带有穿透附魔的弩物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:crossbow",count:1,components:{"minecraft:custom_name":{text:"破甲之弩",color:"aqua",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:piercing":3},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}}}}

# 诸葛连弩：生成带有多重射击和快速装填附魔的弩物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:crossbow",count:1,components:{"minecraft:custom_name":{text:"诸葛连弩",color:"dark_green",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:multishot":1,"minecraft:quick_charge":2},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:163}}}}

# 海王之叉：生成带有导引和忠诚附魔的三叉戟物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:trident",count:1,components:{"minecraft:custom_name":{text:"海王之叉",color:"blue",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:channeling":1,"minecraft:loyalty":3},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:125}}}}

# 防弹头盔：生成带有弹射物防护IV附魔的下界合金头盔物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:netherite_helmet",count:1,components:{"minecraft:custom_name":{text:"防弹头盔",color:"dark_red",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:projectile_protection":4},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:203}}}}

# 龙脊鳞甲：生成无附魔的下界合金胸甲物品实体（可能有隐藏效果）
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:netherite_chestplate",count:1,components:{"minecraft:custom_name":{text:"龙脊鳞甲",color:"gold",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:296}}}}

# 疾行护腿：生成带有迅捷潜行III附魔的下界合金护腿物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:netherite_leggings",count:1,components:{"minecraft:custom_name":{text:"疾行护腿",color:"dark_purple",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:swift_sneak":3},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:271}}}}

# 筋斗足履：生成带有摔落防护IV附魔的下界合金靴子物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:netherite_boots",count:1,components:{"minecraft:custom_name":{text:"筋斗足履",color:"yellow",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:feather_falling":4},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:224}}}}

# 隐身头颅：生成玩家头颅物品实体（可能用于自定义效果）
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:player_head",count:1,components:{"minecraft:custom_name":{text:"隐身头颅",color:"gray",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:1}}}}

# 逐风之翼：生成带有消失诅咒附魔的鞘翅物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:elytra",count:1,components:{"minecraft:custom_name":{text:"逐风之翼",color:"white",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:enchantments":{"minecraft:vanishing_curse":1},"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:216}}}}

# 不死图腾：生成不死图腾物品实体
summon item ~ ~ ~ {PickupDelay:0,Item:{id:"minecraft:totem_of_undying",count:1,components:{"minecraft:custom_name":{text:"不死图腾",color:"green",italic:false},"minecraft:lore":[{text:"死亡后不掉落，复活返还",color:"gold",italic:false},{text:"每次死亡耐久减半（2次后消失）",color:"gray",italic:false}],"minecraft:custom_data":{selkeepinv_artifact:1b,selkeepinv_lives:2,selkeepinv_half_damage:1}}}} 