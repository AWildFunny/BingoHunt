scoreboard objectives add var dummy
# 计算最高分并为其打上 prey 标签（并清理旧标签）
tag @a remove prey
scoreboard players set #max var -2147483648
execute as @a run scoreboard players operation #max var > @s score
execute as @a if score @s score = #max var run tag @s add prey

# 初始化卧底标签
 tag @a remove undercover

# 为猎物展示身份与目标
 title @a[tag=prey] title {"text":"你的身份是：猎物","color":"green","bold":true}
 title @a[tag=prey] subtitle {"text":"游戏目标：击杀末影龙","color":"gray"}

# 在猎人中随机选择一名卧底（排除猎物）
 tag @a[tag=!prey,limit=1,sort=random] add undercover

# 为卧底展示身份与目标
 title @a[tag=undercover] title {"text":"你的身份是：卧底","color":"gold","bold":true}
 title @a[tag=undercover] subtitle {"text":"游戏目标：帮助猎物，击杀末影龙","color":"gray"}

# 为其他猎人展示身份
 title @a[tag=!prey,tag=!undercover] title {"text":"你的身份是：猎人","color":"red","bold":true}
 title @a[tag=!prey,tag=!undercover] subtitle {"text":"游戏目标：击杀全部猎物","color":"gray"}

# 猎物、卧底死亡数初始化
scoreboard objectives add bf.deaths dummy
scoreboard players set @a[tag=prey] bf.deaths 0
scoreboard players set @a[tag=undercover] bf.deaths 0

# 初始化完毕播放音效
execute at @a run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.5 0.5