# 6_deathmatch team tick - any-death detection and prey HUD

# 1) 统计猎物数量（以 prey 标签为准）
scoreboard objectives add bf.tmp dummy

scoreboard players set #prey bf.tmp 0
execute as @a[tag=prey] run scoreboard players add #prey bf.tmp 1

# 2) 任意死亡检测：比较 minecraft.deaths 的增量
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
execute as @a if score @s bf.deaths_all > @s bf.deaths_prev run function main:6_deathmatch/team/on_death
# 同步 prev，防止重复判定
execute as @a run scoreboard players operation @s bf.deaths_prev = @s bf.deaths_all

# 3) 根据身份在 actionbar 展示身份与目标（猎物/卧底追加死亡数 X/3）
execute as @a[tag=prey] run title @s actionbar {"text":"[身份] 猎物  ","color":"green","extra":[{"text":"| 目标：击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=undercover] run title @s actionbar {"text":"[身份] 卧底  ","color":"gold","extra":[{"text":"| 目标：帮助猎物，击杀末影龙 ","color":"gray"},{"text":"| 死亡 ","color":"yellow"},{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}
execute as @a[tag=!prey,tag=!undercover] run title @s actionbar {"text":"[身份] 猎人  ","color":"red","extra":[{"text":"| 目标：击杀全部猎物","color":"gray"}]} 