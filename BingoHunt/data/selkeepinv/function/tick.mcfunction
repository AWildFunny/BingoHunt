execute as @a[nbt={Health:0f}] run scoreboard players set @s selkeepinv_kit 2
 
execute as @a[scores={selkeepinv_kit=2}] unless entity @s[nbt={Health:0f}] run function selkeepinv:give_kit