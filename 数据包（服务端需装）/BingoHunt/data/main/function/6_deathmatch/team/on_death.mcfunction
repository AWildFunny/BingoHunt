# 6_deathmatch team on_death - handle any player death
# 依赖：prey(标签), bf.deaths(猎物死亡计数), bf.revive_timer(复活倒计时)

# 0) 非猎物：给予30秒复活时间并进入观察者
#  - 设定复活倒计时 600tick (=30s)
#  - 标记 reviving，并切换旁观者模式
#  - 立即返回
scoreboard objectives add bf.revive_timer dummy
execute unless entity @s[tag=prey] run scoreboard players set @s bf.revive_timer 600
execute unless entity @s[tag=prey] run tag @s add reviving
execute unless entity @s[tag=prey] run gamemode spectator @s
execute unless entity @s[tag=prey] run title @s actionbar {"text":"复活中（30秒）","color":"yellow"}
execute unless entity @s[tag=prey] run return 0

# 1) 猎物：累计死亡次数
scoreboard objectives add bf.deaths dummy
scoreboard players add @s bf.deaths 1

# 2) 达到3次及以上：转为观察者并移除猎物身份
execute if score @s bf.deaths matches 3.. run tag @s remove prey
execute if score @s bf.deaths matches 3.. run tag @s add eliminated
execute if score @s bf.deaths matches 3.. run gamemode spectator @s

# 3) 若达到3+，尝试用“卧底”替补；否则宣布猎人胜利
# 3.1) 存在卧底：随机挑选1名卧底替补为猎物，并全员广播标题
execute if score @s bf.deaths matches 3.. if entity @a[tag=undercover] as @r[tag=undercover] run tag @s add uc_selected
execute if entity @a[tag=uc_selected] run tag @a[tag=uc_selected] remove undercover
execute if entity @a[tag=uc_selected] run tag @a[tag=uc_selected] add prey
# 广播：在死者上下文下引用其名，在被选卧底上下文下引用其名
execute if entity @a[tag=uc_selected] as @s run title @a title {"text":"猎物","color":"red","extra":[{"selector":"@s"},{"text":"已死亡！卧底","color":"gold"},{"selector":"@a[tag=uc_selected,limit=1]"},{"text":"代替成为猎物","color":"gold"}]}
execute if entity @a[tag=uc_selected] run title @a subtitle {"text":"猎人目标：击杀全部猎物  ｜  猎物目标：生存至游戏结束","color":"gray"}
execute if entity @a[tag=uc_selected] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.8 1
execute if entity @a[tag=uc_selected] run tag @a remove uc_selected

# 3.2) 不存在卧底：宣布猎人胜利（所有猎物已死亡）
execute if score @s bf.deaths matches 3.. unless entity @a[tag=undercover] run title @a title {"text":"猎人胜利！","color":"red","bold":true}
execute if score @s bf.deaths matches 3.. unless entity @a[tag=undercover] run title @a subtitle {"text":"猎物已经全部死亡","color":"gray"}
execute if score @s bf.deaths matches 3.. unless entity @a[tag=undercover] run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1
