# 展示标题
title @a title {"text":"决战开启","color":"dark_purple","bold":true}
title @a subtitle {"text":"进入末地，开始决战","color":"gray"}

bossbar remove main:6_deathmatch/countdown2

# 初始化决战阶段
scoreboard objectives add dual_stage dummy
scoreboard players set global dual_stage 1

# 初始化倒计时
bossbar add main:circle_time {"text":"猎物剩余时间："}
bossbar set main:circle_time visible true
bossbar set main:circle_time players @a
bossbar set main:circle_time max 300
bossbar set main:circle_time value 300
# 计分目标circle_time在on_playing阶段已经创建过，这里直接将虚拟玩家 circle 在 circle_time 计分板上的数值设为 300（秒）
scoreboard players set circle circle_time 300
# 同上，新建虚拟玩家 circle_max ，将其在 circle_time 计分板上的数值设为 300（秒）
scoreboard players set circle_max circle_time 300

# 开启 dualing 标志并启动 tick 循环
scoreboard objectives add dualing dummy
scoreboard players set global dualing 1
schedule function main:6_deathmatch/tick/_tick 1t replace

# 播放音效
execute at @a run playsound minecraft:item.goat_horn.sound.1 master @a ~ ~ ~ 2 0.6

scoreboard players display name line1 order {text:"当前阶段：决战中"}

# 1 秒后调用计时函数，并以 replace 确保不会重复排队
schedule function main:6_deathmatch/countdown 1s replace