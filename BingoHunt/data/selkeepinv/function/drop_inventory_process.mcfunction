# 生成一个标记实体，用于计算随机投掷方向和距离
$execute positioned 0.0 0.0 0.0 rotated $(random) 0 run summon marker ^ ^ ^$(power) {Tags:["getme"]}

# 从标记实体获取X坐标作为投掷动量
data modify storage selkeepinv:storage g.xmot set from entity @e[type=marker,tag=getme,limit=1,sort=nearest] Pos[0]

# 从标记实体获取Z坐标作为投掷动量
data modify storage selkeepinv:storage g.zmot set from entity @e[type=marker,tag=getme,limit=1,sort=nearest] Pos[2]

# 删除临时标记实体
kill @e[type=marker,tag=getme,limit=1,sort=nearest]

# 调用drop_item函数，使用存储中的数据生成物品实体
function selkeepinv:drop_item with storage selkeepinv:storage g
