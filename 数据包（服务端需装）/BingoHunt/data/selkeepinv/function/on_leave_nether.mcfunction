advancement revoke @s only selkeepinv:leave_nether

tag @s remove KeepInventoryTrue
 
title @s actionbar {"text":"已关闭：死亡不掉落","color":"red"}
tellraw @s {"text":"[选择性保留背包] 已关闭死亡不掉落","color":"red"} 