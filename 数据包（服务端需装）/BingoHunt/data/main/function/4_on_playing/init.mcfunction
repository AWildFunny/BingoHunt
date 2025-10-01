# 向所有玩家发送提示，当前处于 on_playing 阶段
tellraw @a {"text":"[Bingo] 阶段：on_playing","color":"green"}
# 创建名为 circle_time 的计分板（dummy 类型，用作计时）
scoreboard objectives add circle_time dummy

# 循环时间设置
# 将虚拟玩家 circle 在 circle_time 计分板上的数值设为 180（秒）
scoreboard players set circle circle_time 180

# 轮数计数器（全局变量），以假玩家 turn 存储
scoreboard objectives add turn dummy
scoreboard players set turn turn 0

# 同步分数所需的计分板
scoreboard objectives add items_prev dummy
scoreboard objectives add items_delta dummy
scoreboard objectives add hp_calc dummy
# 初始化：将 items_prev 设置为当前 bingo_items，避免首帧把历史累计一次加完
execute as @a run scoreboard players operation @s items_prev = @s bingo_items

# 开启 playing 标志并启动 tick 循环
scoreboard objectives add playing dummy
scoreboard players set global playing 1
schedule function main:tick/_tick 1t replace

# 清除旧的“猎物”和临时“候选”标签
tag @a remove prey
tag @a remove top

# 初始化世界边界
function main:4_on_playing/worldborder/init

# 1 秒后调用计时函数，并以 replace 确保不会重复排队
schedule function main:4_on_playing/countdown 1s replace