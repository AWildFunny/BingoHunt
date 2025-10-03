scoreboard objectives add order dummy
scoreboard objectives modify order displayname {text:"Deathmatch",bold:true}
scoreboard objectives setdisplay sidebar order

# 清空旧行
scoreboard players reset * order

scoreboard players set line1 order 9
scoreboard players set line2 order 8
# execute as @a[tag=prey] run scoreboard players set @s order 7

scoreboard players display name line1 order {text:"当前阶段：决战准备"}
scoreboard players display name line2 order {text:"----------------"}
# execute as @a[tag=prey] run scoreboard players display name @s order {text:"当前猎物：",extra:[{selector:"@s"}]}
# execute as @a[tag=undercover] run scoreboard players display name @s order {text:"当前猎物：",extra:[{selector:"@s"}]}


# 初始化展示分数为基础值
# execute as @e[type=marker,tag=dm_sb] run scoreboard players operation @s dm.sidebar = @s dm.base

# 为所有玩家设置侧边栏显示
# execute as @a run scoreboard objectives setdisplay sidebar dm.sidebar 