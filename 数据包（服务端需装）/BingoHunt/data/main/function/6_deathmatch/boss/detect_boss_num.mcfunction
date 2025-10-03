scoreboard objectives add dual.boss_count dummy "Boss (The End)"

# 初始化：若未加载末地区块则强制加载一次
execute unless score #boss_count dual.boss_count matches 1 run function main:6_deathmatch/stage_detect/crystal_forceload

scoreboard players set #boss_count dual.boss_count 0

# 统计boss总数
execute in minecraft:the_end as @e[tag=boss] run scoreboard players add #boss_count dual.boss_count 1