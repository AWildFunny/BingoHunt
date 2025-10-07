# 玩家进入末地的回调（由检测逻辑或进度触发）
# 条件：仅在游戏进行中才响应；首个进入时触发倒计时开场；每次进入给予30s抗性

# 计分板：bf.game, bf.flag（#end_started 触发标志）
scoreboard objectives add bf.flag dummy

# 非进行中直接返回
execute unless score #game bf.game matches 1 run return 0

# 首位进入末地者：仅当 #end_started==0 时启动
execute if score #end_started bf.flag matches 0 run function bingofinal:internal/end_opening_start

# 每次进入末地都给予30s抗性（高等级以近似无敌）
effect give @s resistance 30 255 true

# 允许后续再次进入时继续触发该回调（本轮游戏内）
advancement revoke @s only minecraft:end/root 