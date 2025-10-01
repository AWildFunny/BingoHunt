# 首次部署：在决斗维度原点放置 base1 结构模板（包含实体）
# 依赖：data/bingofinal/structures/base1.nbt
# 放置坐标可按需调整
 execute in bingofinal:duel run forceload add -2 -2 2 2
 execute in bingofinal:duel run place template bingofinal:base1 0 10 0
 execute in bingofinal:duel run spawnpoint @a 22 14 4
 execute in bingofinal:duel run forceload remove -2 -2 2 2
 
 data modify storage bingofinal:state arenaDeployed set value 1b
 tellraw @a {"text":"[BingoFinal] 决斗场已部署（base1）。","color":"gold"} 