# 在玩家当前位置生成物品实体，使用存储中的动量和物品数据，延迟拾取40秒，并标记以应用随机运动
$summon item ~ ~ ~ {Motion:[$(xmot)d,0.20000000298023224d,$(zmot)d],Tags:["selkeepinv.ApplyRandomMotion"],PickupDelay:40s,Item:$(item)}
