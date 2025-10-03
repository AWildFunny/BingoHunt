# 这里编写每 tick 的检测逻辑
function main:6_deathmatch/team/tick
function main:6_deathmatch/sidebar/sidebar_update
execute if score global dual_stage matches 1 run function main:6_deathmatch/stage_detect/crystal_detect
execute if score global dual_stage matches 2 run function main:6_deathmatch/boss/detect_boss_num
execute if score global dual_stage matches 2 run function main:6_deathmatch/boss/detect_boss_death

# 进入末地时检测
execute as @a[advancements={minecraft:story/enter_the_end=true}] run function main:6_deathmatch/spawn/on_enter_end

# 无敌保护倒计时：每tick将有标签end_invul的玩家计时-1
execute as @a[tag=end_invul,scores={invul_timer=1..}] run scoreboard players remove @s invul_timer 1
# 当倒计时归零：移除标签并提示“无敌保护已结束！”
execute as @a[tag=end_invul,scores={invul_timer=0}] run tag @s remove end_invul
execute as @a[scores={invul_timer=0}] run tellraw @s {"text":"无敌保护已结束！","color":"red"}
execute as @a run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 1
# 清理计分归零的残留，避免重复提示
execute as @a[scores={invul_timer=0}] run scoreboard players reset @s invul_timer

# 清理残留bossbar
bossbar remove yet-another-minecraft-bingo:bingo_aqua
bossbar remove yet-another-minecraft-bingo:bingo_blue
bossbar remove yet-another-minecraft-bingo:bingo_gray
bossbar remove yet-another-minecraft-bingo:bingo_green
bossbar remove yet-another-minecraft-bingo:bingo_orange
bossbar remove yet-another-minecraft-bingo:bingo_pink
bossbar remove yet-another-minecraft-bingo:bingo_red
bossbar remove yet-another-minecraft-bingo:bingo_yellow
bossbar remove yet-another-minecraft-bingo:preview