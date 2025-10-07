# 全体玩家：重置定位栏接收与广播距离为 60000000
execute as @a run attribute @s minecraft:waypoint_receive_range base set 60000000
execute as @a run attribute @s minecraft:waypoint_transmit_range base set 60000000

# 重置全部样式
execute as @a run waypoint modify @s style reset

# 猎人：将传输距离设为 0（无法被他人看到路径点）
# execute as @a[tag=!prey,limit=1] run attribute @s minecraft:waypoint_transmit_range base set 0

# 单独样式修改（已注释）
# waypoint modify @a[tag=prey,limit=1] style set bowtie