# 检测所有玩家的健康值为0（死亡状态）且不含有KeepInventoryTrue标签，设置套件记分板为2表示需要复活套件
execute as @a[nbt={Health:0f}] unless entity @s[tag=KeepInventoryTrue] run scoreboard players set @s selkeepinv_kit 2

# 检测套件记分板为2且健康值恢复（复活后）的玩家，发放标准套件并重置记分板
execute as @a[scores={selkeepinv_kit=2}] unless entity @s[nbt={Health:0f}] run function selkeepinv:give_kit