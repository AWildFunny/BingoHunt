# common 模式：按已分配的槽位为玩家放置基地、设置出生点并传送
# 竖向紧凑布局（沿 Y 轴堆叠），基于结构尺寸 30×10×15（X×Y×Z）
# 使用 base1，spawnpoint 采用 (baseX+22, baseY+4, baseZ+4) 规则

# forceload 仅与 XZ 有关，保持当前覆盖范围
execute in bingofinal:duel run forceload add -5 -2 5 2

# 槽位0（base 0,10,0 → spawn 22,14,4）
execute if entity @a[scores={bf.index=0}] run execute in bingofinal:duel run place template bingofinal:base1 0 10 0
execute as @a[scores={bf.index=0}] run execute in bingofinal:duel run tp @s 22 14 4
execute as @a[scores={bf.index=0}] in bingofinal:duel run spawnpoint @s 22 14 4
execute as @a[scores={bf.index=0}] run tellraw @s {"text":"[common] 重生点已设置 (22,14,4)","color":"gold"}

# 槽位1（base 0,22,0 → spawn 22,26,4）
execute if entity @a[scores={bf.index=1}] run execute in bingofinal:duel run place template bingofinal:base1 0 22 0
execute as @a[scores={bf.index=1}] run execute in bingofinal:duel run tp @s 22 26 4
execute as @a[scores={bf.index=1}] in bingofinal:duel run spawnpoint @s 22 26 4
execute as @a[scores={bf.index=1}] run tellraw @s {"text":"[common] 重生点已设置 (22,26,4)","color":"gold"}

# 槽位2（base 0,34,0 → spawn 22,38,4）
execute if entity @a[scores={bf.index=2}] run execute in bingofinal:duel run place template bingofinal:base1 0 34 0
execute as @a[scores={bf.index=2}] run execute in bingofinal:duel run tp @s 22 38 4
execute as @a[scores={bf.index=2}] in bingofinal:duel run spawnpoint @s 22 38 4
execute as @a[scores={bf.index=2}] run tellraw @s {"text":"[common] 重生点已设置 (22,38,4)","color":"gold"}

# 槽位3（base 0,46,0 → spawn 22,50,4）
execute if entity @a[scores={bf.index=3}] run execute in bingofinal:duel run place template bingofinal:base1 0 46 0
execute as @a[scores={bf.index=3}] run execute in bingofinal:duel run tp @s 22 50 4
execute as @a[scores={bf.index=3}] in bingofinal:duel run spawnpoint @s 22 50 4
execute as @a[scores={bf.index=3}] run tellraw @s {"text":"[common] 重生点已设置 (22,50,4)","color":"gold"}

# 槽位4（base 0,58,0 → spawn 22,62,4）
execute if entity @a[scores={bf.index=4}] run execute in bingofinal:duel run place template bingofinal:base1 0 58 0
execute as @a[scores={bf.index=4}] run execute in bingofinal:duel run tp @s 22 62 4
execute as @a[scores={bf.index=4}] in bingofinal:duel run spawnpoint @s 22 62 4
execute as @a[scores={bf.index=4}] run tellraw @s {"text":"[common] 重生点已设置 (22,62,4)","color":"gold"}

# 清理 forceload
execute in bingofinal:duel run forceload remove -5 -2 5 2 