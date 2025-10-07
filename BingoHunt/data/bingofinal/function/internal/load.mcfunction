# 初始化 BingoFinal 数据包
# 用法：/function bingofinal:dual
 tellraw @a {"text":"[BingoFinal] 数据包已加载。使用 /function bingofinal:dual 进入决斗维度。","color":"gold"}
execute unless data storage bingofinal:state arenaDeployed run function bingofinal:internal/deploy_arena

# 初始化计分板与清理残留 Bossbar
scoreboard objectives add bf.flag dummy
scoreboard objectives add bf.timer dummy
scoreboard objectives add bf.end_once dummy
bossbar remove bingofinal:end_timer 