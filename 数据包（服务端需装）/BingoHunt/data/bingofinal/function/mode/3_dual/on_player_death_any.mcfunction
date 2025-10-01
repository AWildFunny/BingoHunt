# 任意死亡事件处理（应以死亡玩家上下文执行）
# 作用：猎物死亡累计3次后转为猎人；当无猎物时宣布猎人胜利
# 依赖：bf.role, bf.index, bf.game, bf.deaths, bf.deaths_all, bf.deaths_prev

# 同步死亡计分板，避免重复触发
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
scoreboard players operation @s bf.deaths_prev = @s bf.deaths_all

# 非进行中直接返回
execute unless score #game bf.game matches 1 run return 0

# 若死者不是猎物则返回
execute unless entity @s[scores={bf.role=2}] run return 0

# 累计该猎物的死亡次数
scoreboard objectives add bf.deaths dummy
scoreboard players add @s bf.deaths 1

# 达到3次及以上：转为猎人并提示
execute if score @s bf.deaths matches 3.. run scoreboard players set @s bf.role 1
execute if score @s bf.deaths matches 3.. run title @s title {"text":"你现在是：猎人","color":"red","bold":true}
execute if score @s bf.deaths matches 3.. run title @s subtitle {"text":"目标：击杀全部猎物","color":"gray"}

# 若场上已无任何猎物，则宣布猎人胜利并结束对局
execute unless entity @a[scores={bf.index=0..,bf.role=2}] run title @a title {"text":"猎人胜利","color":"red","bold":true}
execute unless entity @a[scores={bf.index=0..,bf.role=2}] run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
execute unless entity @a[scores={bf.index=0..,bf.role=2}] run scoreboard players set #game bf.game 0 