tellraw @a {"text":"[3_dual] place_slot0 exec","color":"yellow"}
# 第一次放置
execute in bingofinal:duel run place template bingofinal:base1 0 10 0
# 检测：在 (22,14,4) 脚下是否有方块（粗略验证放置是否成功）
execute in bingofinal:duel unless block 22 13 4 air run tellraw @a {"text":"[3_dual] slot0 placed OK","color":"green"}
execute in bingofinal:duel if block 22 13 4 air run tellraw @a {"text":"[3_dual] slot0 retry 1","color":"red"}
execute in bingofinal:duel if block 22 13 4 air run place template bingofinal:base1 0 10 0
# 第二次检测
execute in bingofinal:duel if block 22 13 4 air run tellraw @a {"text":"[3_dual] slot0 retry 2","color":"red"}
execute in bingofinal:duel if block 22 13 4 air run place template bingofinal:base1 0 10 0
# 为玩家设置出生与传送
execute as @a[scores={bf.index=0}] in bingofinal:duel run spawnpoint @s 22 14 4
execute as @a[scores={bf.index=0}] run execute in bingofinal:duel run tp @s 22 14 4
# 清理 forceload
execute in bingofinal:duel run forceload remove -2 -2 2 2
# 提示：基础就绪后请手动执行 /function bingofinal:random_team_3 