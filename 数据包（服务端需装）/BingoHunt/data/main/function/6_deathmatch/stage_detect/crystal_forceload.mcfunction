# 强制加载末地的一块安全区块（覆盖 -50..+50 块范围）
execute in minecraft:the_end run forceload add -5 -5 5 5
scoreboard players set #crystal_loaded dual.crystal_count 1 