# 末地开场Bossbar倒计时（每秒调度）
scoreboard objectives add bf.timer dummy

# 若计时已到或为0，结束倒计时
execute if score #end_timer bf.timer matches ..0 run bossbar set bingofinal:end_timer name {"text":"倒计时结束","color":"gold"}
execute if score #end_timer bf.timer matches ..0 run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1
execute if score #end_timer bf.timer matches ..0 run bossbar remove bingofinal:end_timer
execute if score #end_timer bf.timer matches ..0 run scoreboard players set #end_started bf.flag 2
execute if score #end_timer bf.timer matches ..0 run return 0

# 递减并刷新显示
scoreboard players remove #end_timer bf.timer 1
execute store result bossbar bingofinal:end_timer value run scoreboard players get #end_timer bf.timer
bossbar set bingofinal:end_timer name {"text":"","extra":[{"score":{"name":"#end_timer","objective":"bf.timer"}},{"text":"秒后其他玩家可进入","color":"gray"}]}

# 继续下一秒
schedule function bingofinal:internal/end_opening_countdown 1s replace 