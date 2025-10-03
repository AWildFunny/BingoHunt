# 决战未开始时传送回出生点
execute unless score global dualing matches 1 run function main:6_deathmatch/spawn/return_spawn

# 决战开始时随机出生点
execute if score global dualing matches 1 run function main:6_deathmatch/spawn/random_spawn
advancement revoke @s only minecraft:story/enter_the_end