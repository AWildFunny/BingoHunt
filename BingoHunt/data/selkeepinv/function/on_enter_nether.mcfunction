advancement revoke @s only selkeepinv:enter_nether

tag @s add KeepInventoryTrue
 
title @s actionbar {"text":"已启用：地狱中死亡不掉落","color":"green"}
tellraw @s {"text":"[选择性保留背包] 地狱中已启用死亡不掉落","color":"green"} 