# 重新标记boss
tellraw @a ["终末母体的位置发生了改变！"]
execute at @a run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.5
# data merge entity @e[tag=boss,limit=1] {Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}
execute at @e[tag=boss] run summon marker ~ ~ ~ {Tags:["death_detector","set_ride"]}
execute at @e[tag=boss] run ride @e[type=marker,tag=death_detector,tag=set_ride,limit=1] mount @e[tag=boss,limit=1]
execute at @e[tag=boss] run tag @e[type=marker,tag=set_ride] remove set_ride
execute at @e[tag=boss] run tag @e[tag=boss] add marked