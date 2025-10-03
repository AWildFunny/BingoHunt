# 将最大值与当前值写入 bossbar
execute store result bossbar main:circle_time max run scoreboard players get circle_max circle_time
execute store result bossbar main:circle_time value run scoreboard players get circle circle_time

# 显示文本：猎物剩余时间：XX秒
bossbar set main:circle_time name {"text":"猎物剩余时间：","color":"white","extra":[{"score":{"name":"circle","objective":"circle_time"}},{"text":"秒"}]}