# 递减倒计时并更新 Bossbar
scoreboard players remove $dm bf.timer 1
execute store result bossbar main:6_deathmatch/countdown value run scoreboard players get $dm bf.timer

# 到 0 则移除 Bossbar 并初始化身份
execute if score $dm bf.timer matches 0 run bossbar remove main:6_deathmatch/countdown
execute if score $dm bf.timer matches 0 run function main:6_deathmatch/team/init_team

# 未到 0 则继续调度
execute if score $dm bf.timer matches 1.. run schedule function main:6_deathmatch/countdown_tick 1s 