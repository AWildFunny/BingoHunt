advancement revoke @s only selkeepinv:detect_death

scoreboard players set @s selkeepinv 0
execute if entity @s[tag=KeepInventoryTrue] run scoreboard players set @s selkeepinv 1

execute if score @s selkeepinv matches 1 run tag @s remove KeepInventoryTrue

execute if score @s selkeepinv matches 0 run function selkeepinv:on_death_drop
