# 初始化/准备（目标记分板需已存在：score）
scoreboard objectives add var dummy
scoreboard objectives add calc dummy

# 变量 bonus_para = 64
scoreboard players set #bonus_para var 64

# 计算最高分并为其打上 prey 标签（并清理旧标签）
tag @a remove prey
scoreboard players set #max var -2147483648
execute as @a run scoreboard players operation #max var > @s score
execute as @a if score @s score = #max var run tag @s add prey

# 为每位玩家计算应发放的货币：calc = score * bonus_para
execute as @a run scoreboard players operation @s calc = @s score
execute as @a run scoreboard players operation @s calc *= #bonus_para var

# 发送提示信息（在扣减发放前读取 calc 数值）
execute as @a run tellraw @s {"text":"你的分数：","color":"gold","extra":[{"score":{"name":"@s","objective":"score"}},{"text":"，已获得货币：","color":"yellow"},{"score":{"name":"@s","objective":"calc"}},{"text":"；货币已发放！","color":"green"}]}

# 发放货币（通过 give 指令，二进制分解扣减 calc）
execute as @a if score @s calc matches 1048576.. run give @s minecraft:emerald 1048576
execute as @a if score @s calc matches 1048576.. run scoreboard players remove @s calc 1048576
execute as @a if score @s calc matches 524288.. run give @s minecraft:emerald 524288
execute as @a if score @s calc matches 524288.. run scoreboard players remove @s calc 524288
execute as @a if score @s calc matches 262144.. run give @s minecraft:emerald 262144
execute as @a if score @s calc matches 262144.. run scoreboard players remove @s calc 262144
execute as @a if score @s calc matches 131072.. run give @s minecraft:emerald 131072
execute as @a if score @s calc matches 131072.. run scoreboard players remove @s calc 131072
execute as @a if score @s calc matches 65536.. run give @s minecraft:emerald 65536
execute as @a if score @s calc matches 65536.. run scoreboard players remove @s calc 65536
execute as @a if score @s calc matches 32768.. run give @s minecraft:emerald 32768
execute as @a if score @s calc matches 32768.. run scoreboard players remove @s calc 32768
execute as @a if score @s calc matches 16384.. run give @s minecraft:emerald 16384
execute as @a if score @s calc matches 16384.. run scoreboard players remove @s calc 16384
execute as @a if score @s calc matches 8192.. run give @s minecraft:emerald 8192
execute as @a if score @s calc matches 8192.. run scoreboard players remove @s calc 8192
execute as @a if score @s calc matches 4096.. run give @s minecraft:emerald 4096
execute as @a if score @s calc matches 4096.. run scoreboard players remove @s calc 4096
execute as @a if score @s calc matches 2048.. run give @s minecraft:emerald 2048
execute as @a if score @s calc matches 2048.. run scoreboard players remove @s calc 2048
execute as @a if score @s calc matches 1024.. run give @s minecraft:emerald 1024
execute as @a if score @s calc matches 1024.. run scoreboard players remove @s calc 1024
execute as @a if score @s calc matches 512.. run give @s minecraft:emerald 512
execute as @a if score @s calc matches 512.. run scoreboard players remove @s calc 512
execute as @a if score @s calc matches 256.. run give @s minecraft:emerald 256
execute as @a if score @s calc matches 256.. run scoreboard players remove @s calc 256
execute as @a if score @s calc matches 128.. run give @s minecraft:emerald 128
execute as @a if score @s calc matches 128.. run scoreboard players remove @s calc 128
execute as @a if score @s calc matches 64.. run give @s minecraft:emerald 64
execute as @a if score @s calc matches 64.. run scoreboard players remove @s calc 64
execute as @a if score @s calc matches 32.. run give @s minecraft:emerald 32
execute as @a if score @s calc matches 32.. run scoreboard players remove @s calc 32
execute as @a if score @s calc matches 16.. run give @s minecraft:emerald 16
execute as @a if score @s calc matches 16.. run scoreboard players remove @s calc 16
execute as @a if score @s calc matches 8.. run give @s minecraft:emerald 8
execute as @a if score @s calc matches 8.. run scoreboard players remove @s calc 8
execute as @a if score @s calc matches 4.. run give @s minecraft:emerald 4
execute as @a if score @s calc matches 4.. run scoreboard players remove @s calc 4
execute as @a if score @s calc matches 2.. run give @s minecraft:emerald 2
execute as @a if score @s calc matches 2.. run scoreboard players remove @s calc 2
execute as @a if score @s calc matches 1.. run give @s minecraft:emerald 1
execute as @a if score @s calc matches 1.. run scoreboard players remove @s calc 1
