tellraw @a {"text":"[3_dual] step1_setup begin","color":"yellow"}
scoreboard objectives add bf.role dummy
scoreboard objectives add bf.index dummy
scoreboard objectives add bf.game dummy
scoreboard objectives add bf.lives dummy
scoreboard objectives add bf.deaths dummy
scoreboard objectives add bf.tmp dummy
scoreboard objectives add bf.deaths_all minecraft.custom:minecraft.deaths
scoreboard objectives add bf.deaths_prev dummy
# 重置旧值，避免历史 index=0 导致误去除参赛资格
scoreboard players reset @a bf.index
scoreboard players reset @a bf.role
# 注意：此处不再设置 #game=1，改到分配身份后再设置
tellraw @a {"text":"[3_dual] step1_setup end","color":"yellow"} 