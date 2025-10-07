# 入口：BingoFinal 通用模式
# 用法：/function bingofinal:dual

# 将所有玩家送入决斗维度（保留原意）
execute as @a run execute in bingofinal:duel run tp @s 22 14 4

# 通用模式：自动分配槽位并放置基地/出生点/传送
function bingofinal:mode/common/run
