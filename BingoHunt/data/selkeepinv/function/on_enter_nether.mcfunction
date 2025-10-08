# 撤销玩家的enter_nether进展，防止重复触发
advancement revoke @s only selkeepinv:enter_nether

# 为玩家添加KeepInventoryTrue标签，表示在地狱中死亡时保留库存
tag @s add KeepInventoryTrue

# 在动作栏显示启用消息
title @s actionbar {"text":"已启用：地狱中死亡不掉落","color":"green"}

# 发送聊天消息通知玩家
tellraw @s {"text":"[选择性保留背包] 地狱中已启用死亡不掉落","color":"green"} 