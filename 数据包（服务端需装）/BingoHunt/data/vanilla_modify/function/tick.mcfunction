# 每tick：对未处理的末影人一次性应用属性修正，生命×0.5，攻击×0.25，并打标签避免重复处理

# 先移除旧修正（若不存在则无影响），确保一致性
execute as @e[type=minecraft:enderman,tag=!vm.mod] run attribute @s minecraft:max_health modifier remove vanilla_modify:half
execute as @e[type=minecraft:enderman,tag=!vm.mod] run attribute @s minecraft:attack_damage modifier remove vanilla_modify:quarter

# 添加总量乘法修正：-0.5 => 总量×(1-0.5)=0.5；-0.75 => 总量×(1-0.75)=0.25
execute as @e[type=minecraft:enderman,tag=!vm.mod] run attribute @s minecraft:max_health modifier add vanilla_modify:half -0.5 add_multiplied_total
execute as @e[type=minecraft:enderman,tag=!vm.mod] run attribute @s minecraft:attack_damage modifier add vanilla_modify:quarter -0.75 add_multiplied_total

# 给当前实体打标记，避免后续tick重复执行
execute as @e[type=minecraft:enderman,tag=!vm.mod] run tag @s add vm.mod 