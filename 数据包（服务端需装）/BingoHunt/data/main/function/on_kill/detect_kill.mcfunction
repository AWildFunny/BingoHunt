# 基于事件的PVP击杀回调：此函数由 advancement 触发，仅在“玩家被玩家击杀”时执行一次
# 参考：死亡检测与事件触发（Java） https://minecraftcommands.github.io/wiki/questions/playerdeaths.html
# 参考：execute on attacker 语法（Java） https://minecraft.fandom.com/wiki/Commands/execute

# 确保临时计分板存在（如已存在会报错但不影响执行）
scoreboard objectives add newscore dummy
# 确保常量计分板存在
scoreboard objectives add const dummy
# 设置常量 2（用于除以2）
scoreboard players set #two const 2

# 给当前被击杀的玩家（@s）打临时标记，便于在 attacker 上下文引用受害者
tag @s add rx.victim_tmp

# 计算 newscore = 受害者当前 score ÷ 2
execute as @s run scoreboard players operation @s newscore = @s score
# 执行 newscore ÷= 2
execute as @s run scoreboard players operation @s newscore /= #two const

# 将受害者分数设置为 newscore（减半）
execute as @s run scoreboard players operation @s score = @s newscore

# 给受害者发消息：由于你被A击杀，分数减半为 newscore（在 attacker 上下文中取 A 的名字）
execute on attacker if entity @s[type=player] run tellraw @a[tag=rx.victim_tmp,limit=1] [{"text":"由于你被 "},{"selector":"@s"},{"text":" 击杀，分数减半为 "},{"score":{"name":"@a[tag=rx.victim_tmp,limit=1]","objective":"newscore"}}]

# 将击杀者 A 的分数增加 newscore（A_score += newscore）
execute on attacker if entity @s[type=player] run scoreboard players operation @s score += @a[tag=rx.victim_tmp,limit=1] newscore

# 通知击杀者 A：夺取了B一半的分数：newscore，你的分数增加了
execute on attacker if entity @s[type=player] run tellraw @s [{"text":"夺取了 "},{"selector":"@a[tag=rx.victim_tmp,limit=1]"},{"text":" 一半的分数："},{"score":{"name":"@a[tag=rx.victim_tmp,limit=1]","objective":"newscore"}},{"text":"，你的分数增加了"}]

# 所有猎人（非 prey）+1 分并广播：猎物B被A截杀，所有猎人分数+1
execute on attacker if entity @s[type=player] run scoreboard players add @a[tag=!prey] score 1
# 广播给所有猎人：包含 B 与 A 的名字
execute on attacker if entity @s[type=player] run tellraw @a[tag=!prey] [{"text":"猎物 "},{"selector":"@a[tag=rx.victim_tmp,limit=1]"},{"text":" 被 "},{"selector":"@s"},{"text":" 截杀，所有猎人分数+1"}]

# 清理：移除受害者临时标记
tag @s remove rx.victim_tmp

# 撤销本次成就以便下次死亡可再次触发
advancement revoke @s only main:on_pvp_kill 