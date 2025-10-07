tellraw @a {"text":"[3_dual] step2_pick begin","color":"yellow"}
tag @a remove bf.assigned
tag @a remove bf.unassigned
tag @a add bf.unassigned
# 槽位0
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 0
 execute as @a[scores={bf.index=0},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位1
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 1
 execute as @a[scores={bf.index=1},tag=bf.unassigned] run tag @s remove bf.unassigned
# 槽位2
 execute as @a[tag=bf.unassigned,limit=1,sort=random] run scoreboard players set @s bf.index 2
 execute as @a[scores={bf.index=2},tag=bf.unassigned] run tag @s remove bf.unassigned
# 调试：展示各槽位选中的玩家名
execute as @a[scores={bf.index=0}] run tellraw @a {"text":"[3_dual] 槽位0= ","color":"yellow","extra":[{"selector":"@s"}]}
execute as @a[scores={bf.index=1}] run tellraw @a {"text":"[3_dual] 槽位1= ","color":"yellow","extra":[{"selector":"@s"}]}
execute as @a[scores={bf.index=2}] run tellraw @a {"text":"[3_dual] 槽位2= ","color":"yellow","extra":[{"selector":"@s"}]}

tellraw @a {"text":"[3_dual] step2_pick end","color":"yellow"} 