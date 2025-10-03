tellraw @a {"text":"[Bingo] 阶段：on_starting","color":"blue"} 
scoreboard objectives add score dummy
scoreboard players set @a score 0 

# 运行load初始化
function selkeepinv:load