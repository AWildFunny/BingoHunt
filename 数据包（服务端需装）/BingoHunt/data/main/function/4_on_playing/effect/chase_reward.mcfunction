# 猎人 +1 奖励：当非 prey 玩家本次分数仅增加 1 时，给予 60 秒速度效果
# 参考 main:4_on_playing/scoreboard/update_score 的差值写法
# 依赖计分板：
# - score 总分
# 新增计分板：
# - score_prev（dummy） 记录上次已处理的分数
# - score_delta（dummy） 本次差值

# 确保计分板存在（如已存在会报错但不影响执行）
scoreboard objectives add score_prev dummy
scoreboard objectives add score_delta dummy

# 计算各猎人本次差值：delta = score - score_prev
execute as @a[tag=!prey] run scoreboard players operation @s score_delta = @s score
execute as @a[tag=!prey] run scoreboard players operation @s score_delta -= @s score_prev

# 若仅 +1，则给予速度 I（60s，隐藏粒子）
execute as @a[tag=!prey] if score @s score_delta matches 1 run effect give @s minecraft:speed 60 0 true

# 同步快照：只要发生变化（非 0），就 prev := 当前 score，避免累计误判
execute as @a[tag=!prey] unless score @s score_delta matches 0 run scoreboard players operation @s score_prev = @s score

# 可选调试：打印本次 delta（默认关闭）
# execute as @a[tag=!prey] run tellraw @a [{"text":"[chase_reward] ","color":"gray"},{"selector":"@s"},{"text":" delta=","color":"gray"},{"score":{"name":"@s","objective":"score_delta"},"color":"gold"}]
