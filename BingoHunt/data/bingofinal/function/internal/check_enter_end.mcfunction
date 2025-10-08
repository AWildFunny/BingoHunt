# 基于原版进度的末地进入检测（每tick调用）
# 条件：仅在游戏进行中检测
# execute unless score #game bf.game matches 1 run return 0

# 有该原版进度的玩家视为刚进入末地（需在开局时或本函数内撤销以便复用）
execute as @a[advancements={minecraft:end/root=true}] run function bingofinal:internal/on_enter_end