tellraw @a {"text":"[3_dual] step3_place begin","color":"yellow"}
# 槽位0
 execute if entity @a[scores={bf.index=0}] run tellraw @a {"text":"[3_dual] place slot0 (0,10,0)","color":"yellow"}
 execute if entity @a[scores={bf.index=0}] run execute in bingofinal:duel run forceload add -2 -2 2 2
 execute if entity @a[scores={bf.index=0}] run schedule function bingofinal:mode/3_dual/place_slot0 1t
# 槽位1（顺序延迟3t）
 execute if entity @a[scores={bf.index=1}] run tellraw @a {"text":"[3_dual] place slot1 (32,10,0)","color":"yellow"}
 execute if entity @a[scores={bf.index=1}] run execute in bingofinal:duel run forceload add 0 -2 4 2
 execute if entity @a[scores={bf.index=1}] run schedule function bingofinal:mode/3_dual/place_slot1 3t
# 槽位2（顺序延迟5t）
 execute if entity @a[scores={bf.index=2}] run tellraw @a {"text":"[3_dual] place slot2 (64,10,0)","color":"yellow"}
 execute if entity @a[scores={bf.index=2}] run execute in bingofinal:duel run forceload add 1 -2 5 2
 execute if entity @a[scores={bf.index=2}] run schedule function bingofinal:mode/3_dual/place_slot2 5t
 tellraw @a {"text":"[3_dual] step3_place end","color":"yellow"}
# 调试：显示被赋值 index 的玩家是否存在
execute unless entity @a[scores={bf.index=0}] run tellraw @a {"text":"[3_dual] 警告：没有分配到槽位0的玩家","color":"red"}
execute unless entity @a[scores={bf.index=1}] run tellraw @a {"text":"[3_dual] 警告：没有分配到槽位1的玩家","color":"red"}
execute unless entity @a[scores={bf.index=2}] run tellraw @a {"text":"[3_dual] 警告：没有分配到槽位2的玩家","color":"red"} 