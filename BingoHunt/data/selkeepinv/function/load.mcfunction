# 设置游戏规则keepInventory为true，防止死亡掉落物品（但本数据包会自定义处理）
gamerule keepInventory true

# 创建记分板目标selkeepinv，用于存储玩家是否保留库存的标志
scoreboard objectives add selkeepinv dummy

# 创建记分板目标selkeepinv_kit，用于跟踪玩家的套件状态（0:标准，2:复活中）
scoreboard objectives add selkeepinv_kit dummy