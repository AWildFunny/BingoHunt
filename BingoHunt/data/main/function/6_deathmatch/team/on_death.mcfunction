# 6_deathmatch team on_death - handle any player death
# 规则：
# - 猎人：无限复活，不添加观察者限制（直接返回，不做处理）
# - 猎物/卧底：各自三条命；达到3次后转为旁观者并显示标题
#   * 猎物用尽三条命：尝试用卧底替补为猎物并将自己TP至新的猎物处；若没有卧底，则宣布猎人胜利
#   * 卧底用尽三条命：若仍有猎物存在，将自己TP至任意猎物处；若没有猎物，则宣布猎人胜利

# 计分目标（已在 init 中创建；此处再次添加以容错）
scoreboard objectives add bf.deaths dummy

# 0) 猎人（既不是猎物也不是卧底）：不限制复活，直接返回
execute unless entity @s[tag=prey] unless entity @s[tag=undercover] run return 0

# 1) 增加死亡次数（适用于猎物与卧底）
scoreboard players add @s bf.deaths 1

# 2) 未达3次：直接返回
execute if score @s bf.deaths matches ..2 run return 0

# 3) 达到3次及以上：统一显示淘汰标题并设置旁观者
title @s title {"text":"你死了！","color":"red","bold":true}
title @s subtitle {"text":"已无法复活","color":"gray"}
gamemode spectator @s

# 4) 分支处理
# 4.1) 若为猎物：尝试用“卧底”替补
# 随机挑选卧底作为替补（临时标签 uc_selected）
execute if entity @s[tag=prey] if entity @a[tag=undercover] as @r[tag=undercover] run tag @s add uc_selected
# 选中者转为猎物
execute if entity @s[tag=prey] if entity @a[tag=uc_selected] run tag @a[tag=uc_selected] remove undercover
execute if entity @s[tag=prey] if entity @a[tag=uc_selected] run tag @a[tag=uc_selected] add prey
# 重置新猎物的死亡计数为 0，避免继承卧底旧计数导致立即淘汰
execute if entity @s[tag=prey] if entity @a[tag=uc_selected] run scoreboard players set @a[tag=uc_selected,limit=1] bf.deaths 0
# 将被淘汰的自己传送到新猎物处
execute if entity @s[tag=prey] if entity @a[tag=uc_selected] run tp @s @a[tag=uc_selected,limit=1]
# 清理临时标签
execute if entity @s[tag=prey] if entity @a[tag=uc_selected] run tag @a remove uc_selected
# 若没有卧底可替补：宣布猎人胜利
execute if entity @s[tag=prey] unless entity @a[tag=undercover] run function main:6_deathmatch/decide/hunter_win
# 移除自己的猎物身份，标记淘汰
execute if entity @s[tag=prey] run tag @s remove prey
execute if entity @s[tag=prey] run tag @s add eliminated

# 4.2) 若为卧底：根据猎物是否存在决定传送或直接宣布胜利
# 若仍有猎物：把自己传送到任意猎物处
execute if entity @s[tag=undercover] if entity @a[tag=prey] run tp @s @r[tag=prey]
# 若没有猎物：宣布猎人胜利
execute if entity @s[tag=undercover] unless entity @a[tag=prey] run function main:6_deathmatch/decide/hunter_win
# 卧底淘汰标记与身份移除
execute if entity @s[tag=undercover] run tag @s add eliminated
execute if entity @s[tag=undercover] run tag @s remove undercover
