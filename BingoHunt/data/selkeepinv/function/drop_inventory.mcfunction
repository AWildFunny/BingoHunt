$data modify storage selkeepinv:storage g.item set from entity @s Inventory[$(Itemnum)]
data remove storage selkeepinv:storage g.item.Slot

$execute positioned 0.0 0.0 0.0 rotated $(random) 0 run summon marker ^ ^ ^$(power) {Tags:["getme"]}

data modify storage selkeepinv:storage g.xmot set from entity @e[type=marker,tag=getme,limit=1,sort=nearest] Pos[0]
data modify storage selkeepinv:storage g.zmot set from entity @e[type=marker,tag=getme,limit=1,sort=nearest] Pos[2]
kill @e[type=marker,tag=getme,limit=1,sort=nearest]

function selkeepinv:drop_item with storage selkeepinv:storage g

scoreboard players remove Count selkeepinv 1

execute store result score Itemnum selkeepinv run data get storage selkeepinv:storage g.Itemnum
scoreboard players remove Itemnum selkeepinv 1
execute store result storage selkeepinv:storage g.Itemnum int 1 run scoreboard players get Itemnum selkeepinv

execute store result storage selkeepinv:storage g.random float 1 run random value 0..360
execute store result storage selkeepinv:storage g.power float 0.005 run random value 1..100
execute if score Count selkeepinv matches 1.. run function selkeepinv:drop_inventory with storage selkeepinv:storage g
