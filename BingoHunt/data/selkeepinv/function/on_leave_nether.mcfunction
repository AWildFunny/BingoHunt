# 撤销玩家的leave_nether进展，防止重复触发
advancement revoke @s only selkeepinv:leave_nether

# 移除玩家的KeepInventoryTrue标签，关闭保留效果
tag @s remove KeepInventoryTrue

# 在动作栏显示关闭消息
title @s actionbar {"text":"已关闭：死亡不掉落","color":"red"}

# 发送聊天消息通知玩家
tellraw @s {"text":"[选择性保留背包] 已关闭死亡不掉落","color":"red"} 