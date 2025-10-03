scoreboard players add circle circle_time 120
scoreboard players add circle_max circle_time 120
function main:6_deathmatch/bossbar/circle_bar
tellraw @a {"text":"末地水晶被摧毁，猎物时间+120秒！","color":"gold"}

# 播放音效
execute as @a run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 1

# 猎物分数增加
execute as @s[type=player] run scoreboard players add @a[tag=prey] score 1