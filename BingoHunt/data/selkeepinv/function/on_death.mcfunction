# 撤销玩家的detect_death进展，防止重复触发
advancement revoke @s only selkeepinv:detect_death

# 初始化玩家的selkeepinv记分板值为0（默认不保留）
scoreboard players set @s selkeepinv 0

# 如果玩家有KeepInventoryTrue标签（地狱中启用保留），则设置为1
execute if entity @s[tag=KeepInventoryTrue] run scoreboard players set @s selkeepinv 1

# 如果保留库存，移除标签（一次性效果）
execute if score @s selkeepinv matches 1 run tag @s remove KeepInventoryTrue

# 如果不保留库存，调用丢弃函数
execute if score @s selkeepinv matches 0 run function selkeepinv:on_death_drop
