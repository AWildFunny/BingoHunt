execute store result score Count selkeepinv run data get entity @s Inventory
 
data modify storage selkeepinv:storage g.Itemnum set value 0
execute store result storage selkeepinv:storage g.random float 1 run random value 0..360
execute store result storage selkeepinv:storage g.power float 0.005 run random value 0..100
function selkeepinv:drop_inventory with storage selkeepinv:storage g
clear @s 