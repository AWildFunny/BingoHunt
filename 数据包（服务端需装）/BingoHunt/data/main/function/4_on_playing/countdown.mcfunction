# 将 circle_time 计时减 1（以虚拟玩家 circle 作为存储槽位）
scoreboard players remove circle circle_time 1  

# 若计时为 0，则调用 circle 主逻辑
execute if score circle circle_time matches 0 run function main:4_on_playing/circle 

# 若计时为 0，则重置为 30 秒，准备下一轮 
execute if score circle circle_time matches 0 run scoreboard players set circle circle_time 180  

# 继续在 1 秒后再次执行自身，实现循环计时 
schedule function main:4_on_playing/countdown 1s  