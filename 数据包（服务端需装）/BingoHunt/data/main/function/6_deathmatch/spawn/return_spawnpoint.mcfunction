tag @s add KeepInventoryTrue
kill @s
tellraw @s {"text":"决战未开始，不允许进入末地！","color":"red"}
tag @s remove KeepInventoryTrue