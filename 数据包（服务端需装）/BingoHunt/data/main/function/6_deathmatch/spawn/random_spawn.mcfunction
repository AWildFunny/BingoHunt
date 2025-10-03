# 确保存在用于轮转与计时的计分板目标（若已存在会忽略）
scoreboard objectives add spawn_cycle dummy
scoreboard objectives add invul_timer dummy

# 轮转计数器加一（使用假玩家 #end_spawn_cycle 记录全局状态）
scoreboard players add #end_spawn_cycle spawn_cycle 1
# 若计数达到4则归零，保证在0..3之间循环
execute if score #end_spawn_cycle spawn_cycle matches 4.. run scoreboard players set #end_spawn_cycle spawn_cycle 0

# 说明：末地“龙池”（返回传送门）通常位于地表（约Y=63）。此处取其高度+20 ≈ Y=83，避免卡方块且留出下落缓冲。
# 情况0：传送到点位(60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 0 run execute in minecraft:the_end run tp @s 60 83 0
# 情况1：传送到点位(-60, 83, 0)
execute if score #end_spawn_cycle spawn_cycle matches 1 run execute in minecraft:the_end run tp @s -60 83 0
# 情况2：传送到点位(0, 83, 60)
execute if score #end_spawn_cycle spawn_cycle matches 2 run execute in minecraft:the_end run tp @s 0 83 60
# 情况3：传送到点位(0, 83, -60)
execute if score #end_spawn_cycle spawn_cycle matches 3 run execute in minecraft:the_end run tp @s 0 83 -60

# 给予当前玩家15秒抗性效果，缓冲下落与初始伤害
effect give @s minecraft:resistance 15 255 true
# 打上“无敌保护”标签，启动15秒（300tick）倒计时
scoreboard players set @s invul_timer 300
# 给予音效
execute as @a run playsound minecraft:entity.player.teleport master @a ~ ~ ~ 2 0.5
# 记录标签用于tick中识别倒计时目标
tag @s add end_invul
