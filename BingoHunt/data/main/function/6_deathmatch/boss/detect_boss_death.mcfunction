# 这个函数只能被每秒调用（countdown），而不能每tick调用。因为boss死亡检测具有tick滞后性

# —— Boss 死亡掉落（在死亡位置召唤发光掉落实体，避免重复） ——
# 所有带有乘客Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]的实体，都将再濒死时被检测到（参考：https://minecraftcommands.github.io/wiki/questions/mobdeaths.html）
execute as @e[type=marker,tag=death_detector] on vehicle unless data entity @s {DeathTime:0s} run function main:6_deathmatch/boss/on_boss_killed
# 补充：对于瞬移不在出生位置、导致marker丢失的boss，重新添加骑乘物标记
execute unless data entity @e[tag=boss,limit=1] {Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]} run function main:6_deathmatch/boss/re_mark

# —— 使用 belowName 展示 Boss 自身血量 ——
# 创建/设置 belowname 槽显示的记分项 boss_hp（dummy，每 tick 手动写入）
# scoreboard objectives add boss_hp dummy
# scoreboard objectives modify boss_hp numberformat styled {color:"red",font:"minecraft:uniform"}
# scoreboard objectives setdisplay belowname boss_hp
# 确保 Boss 名称可见（Shulker 生成时已是 1b，这里容错设置；Enderman 也强制可见）
# execute as @e[tag=boss] run data modify entity @s CustomNameVisible set value 1b
# execute as @e[tag=boss] run data modify entity @s CustomNameVisible set value 1b
# 将 Health 写入对应实体作为分数（比例系数1，保留一位小数可按需改为2/10倍）
# execute as @e[tag=boss] store result score @s boss_hp run data get entity @s Health 1
# execute as @e[tag=boss,tag=!boss] store result score @s boss_hp run data get entity @s Health 1
