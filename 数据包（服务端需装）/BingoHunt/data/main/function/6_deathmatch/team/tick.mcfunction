# 6_deathmatch team tick - any-death detection and prey HUD

# 1) 统计猎物数量（以 prey 标签为准）
scoreboard objectives add bf.tmp dummy
scoreboard objectives add bf.deaths dummy
scoreboard players set #prey bf.tmp 0
execute as @a[tag=prey] run scoreboard players add #prey bf.tmp 1

# 2) 任意死亡检测：比较 minecraft.deaths 的增量
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
execute as @a if score @s bf.deaths_all > @s bf.deaths_prev run function main:6_deathmatch/team/on_death
# 同步 prev，防止重复判定
execute as @a run scoreboard players operation @s bf.deaths_prev = @s bf.deaths_all

# 3) 对所有猎物在 actionbar 显示实时死亡数 X/3
execute as @a[tag=prey] run title @s actionbar {"text":"[死亡] ","color":"yellow","extra":[{"score":{"name":"@s","objective":"bf.deaths"}},{"text":"/3","color":"gray"}]}

# 4) 复活倒计时与观战还原
scoreboard objectives add bf.revive_timer dummy
execute as @a[tag=reviving] run scoreboard players remove @s bf.revive_timer 1
execute as @a[tag=reviving,scores={bf.revive_timer=..0}] run gamemode survival @s
execute as @a[tag=reviving,scores={bf.revive_timer=..0}] run tag @s remove reviving
execute as @a[tag=reviving,scores={bf.revive_timer=..0}] run scoreboard players set @s bf.revive_timer 0 