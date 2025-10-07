# 每 tick 执行的逻辑，仅在 dualing=1 时生效
execute if score global dualing matches 1 run function main:6_deathmatch/tick/main
execute if score global dualing matches 1 run schedule function main:6_deathmatch/tick/_tick 1t replace 