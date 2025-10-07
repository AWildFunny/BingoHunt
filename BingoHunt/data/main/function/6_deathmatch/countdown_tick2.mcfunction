# 递减倒计时并更新 Bossbar
scoreboard players remove $dm bf.timer 1
execute store result bossbar main:6_deathmatch/countdown2 value run scoreboard players get $dm bf.timer

# actionbar
execute as @a[tag=prey] run title @s actionbar {"text":"[身份] 猎物  ","color":"green","extra":[{"text":"| 目标：击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=undercover] run title @s actionbar {"text":"[身份] 卧底  ","color":"gold","extra":[{"text":"| 目标：帮助猎物，击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=!prey,tag=!undercover] run title @s actionbar {"text":"[身份] 猎人  ","color":"red","extra":[{"text":"| 目标：击杀全部猎物","color":"gray"}]} 

function main:6_deathmatch/sidebar/sidebar_update

# 倒计时音效
execute as @a if score $dm bf.timer matches 60 run tellraw @a {"text":"决战准备：最后一分钟！","color":"red"}
execute as @a if score $dm bf.timer matches 60 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1

# 倒计时音效
execute as @a if score $dm bf.timer matches 4 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1
execute as @a if score $dm bf.timer matches 3 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1
execute as @a if score $dm bf.timer matches 2 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1
execute as @a if score $dm bf.timer matches 1 run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2

# 到 0 则移除 Bossbar
execute if score $dm bf.timer matches 0 run bossbar remove main:6_deathmatch/countdown2
# 调用决战
execute if score $dm bf.timer matches 0 run function main:6_deathmatch/start_dual

# 未到 0 则继续调度
execute if score $dm bf.timer matches 1.. run schedule function main:6_deathmatch/countdown_tick2 1s