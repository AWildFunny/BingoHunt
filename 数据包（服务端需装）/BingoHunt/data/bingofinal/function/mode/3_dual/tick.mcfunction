# 3_dual tick - extended for any-death detection
# 仅当游戏进行中生效
execute unless score #game bf.game matches 1 run return 0

# 统计猎物数量
scoreboard objectives add bf.tmp dummy
scoreboard players set #prey bf.tmp 0
execute as @a[scores={bf.role=2}] run scoreboard players add #prey bf.tmp 1

# 任意死亡检测：比较 minecraft.deaths 的增量
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
# 对参赛者（index=0..）检测是否有新死亡
execute as @a[scores={bf.index=0..}] if score @s bf.deaths_all > @s bf.deaths_prev run function bingofinal:mode/3_dual/on_player_death_any

# 调试：对所有猎物在 actionbar 显示实时死亡数 X/3
execute as @a[scores={bf.role=2}] run title @s actionbar {"text":"[死亡] ","color":"yellow","extra":[{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}

# 基于原版进度的末地进入检测（每tick）
function bingofinal:internal/check_enter_end 