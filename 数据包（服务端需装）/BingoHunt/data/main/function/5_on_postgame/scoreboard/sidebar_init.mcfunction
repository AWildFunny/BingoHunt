# 一次性初始化：积分排行
scoreboard objectives add bh_ui dummy
scoreboard objectives modify bh_ui displayname {text:"积分排行",bold:true}
scoreboard objectives setdisplay sidebar bh_ui

# 清空旧行
scoreboard players reset * bh_ui

# 将所有在线玩家的得分写入排行目标（目标名假定为 score）
execute as @a run scoreboard players operation @s bh_ui = @s score

# 为每位玩家设置左列名字为“<玩家名>：”
execute as @a run scoreboard players display name @s bh_ui {text:"",extra:[{selector:"@s"},{text:"："}]}

# 右列显示为固定“<分数>分”需要固定组件，但 fixed 会丢失数字动态；结算阶段分数不再变化，可直接写入 fixed 文本
# 把每位玩家当前分数读取出来并写为 fixed 文本（两步：拷贝分数到临时 holder，然后生成 fixed）
# 简化：使用全局数字样式黄色，保持原始数字显示，再创建一个“单位”行会多一行，不理想。这里直接保持数字，不加“分”。

# 排序：侧边栏默认按分数降序显示，无需额外命令。