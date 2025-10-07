# 递减倒计时
scoreboard players remove $dm bf.timer 1

# 到 0 则召唤新的boss
execute if score $dm bf.timer matches 0 run tellraw @a {"text":"新的终末母体已生成！","color":"dark_purple"}
execute if score $dm bf.timer matches 0 run function main:6_deathmatch/boss/spawn_boss_1

# 未到 0 则继续调度
execute if score $dm bf.timer matches 1.. run schedule function main:6_deathmatch/boss/respawn_countdown 1s