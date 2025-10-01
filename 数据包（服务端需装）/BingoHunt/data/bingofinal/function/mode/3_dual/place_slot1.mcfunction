tellraw @a {"text":"[3_dual] place_slot1 exec","color":"yellow"}
execute in bingofinal:duel run place template bingofinal:base1 32 10 0
execute in bingofinal:duel unless block 54 13 4 air run tellraw @a {"text":"[3_dual] slot1 placed OK","color":"green"}
execute in bingofinal:duel if block 54 13 4 air run tellraw @a {"text":"[3_dual] slot1 retry 1","color":"red"}
execute in bingofinal:duel if block 54 13 4 air run place template bingofinal:base1 32 10 0
execute in bingofinal:duel if block 54 13 4 air run tellraw @a {"text":"[3_dual] slot1 retry 2","color":"red"}
execute in bingofinal:duel if block 54 13 4 air run place template bingofinal:base1 32 10 0
execute as @a[scores={bf.index=1}] in bingofinal:duel run spawnpoint @s 54 14 4
execute as @a[scores={bf.index=1}] run execute in bingofinal:duel run tp @s 54 14 4
execute in bingofinal:duel run forceload remove 0 -2 4 2
# 提示：基础就绪后请手动执行 /function bingofinal:random_team_3 