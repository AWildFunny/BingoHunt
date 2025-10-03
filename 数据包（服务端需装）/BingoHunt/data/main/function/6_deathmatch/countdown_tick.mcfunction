# 递减倒计时并更新 Bossbar
scoreboard players remove $dm bf.timer 1
execute store result bossbar main:6_deathmatch/countdown value run scoreboard players get $dm bf.timer

# 到 0 则移除 Bossbar
execute if score $dm bf.timer matches 0 run bossbar remove main:6_deathmatch/countdown

# 未到 0 则继续调度
execute if score $dm bf.timer matches 1.. run schedule function main:6_deathmatch/countdown_tick 1s

# actionbar
execute as @a[tag=prey] run title @s actionbar {"text":"[身份] 猎物  ","color":"green","extra":[{"text":"| 目标：击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=undercover] run title @s actionbar {"text":"[身份] 卧底  ","color":"gold","extra":[{"text":"| 目标：帮助猎物，击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=!prey,tag=!undercover] run title @s actionbar {"text":"[身份] 猎人  ","color":"red","extra":[{"text":"| 目标：击杀全部猎物","color":"gray"}]} 

# 调用 allocate 执行货币分配
execute if score $dm bf.timer matches 0 run function main:6_deathmatch/allocate
# 继续下一阶段
execute if score $dm bf.timer matches 0 run function main:6_deathmatch/start_prepare