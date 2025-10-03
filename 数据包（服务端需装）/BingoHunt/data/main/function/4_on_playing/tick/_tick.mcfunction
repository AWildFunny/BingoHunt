# 每 tick 执行的逻辑，仅在 playing=1 时生效
execute if score global playing matches 1 run function main:4_on_playing/tick/main
execute if score global playing matches 1 run schedule function main:4_on_playing/tick/_tick 1t replace 