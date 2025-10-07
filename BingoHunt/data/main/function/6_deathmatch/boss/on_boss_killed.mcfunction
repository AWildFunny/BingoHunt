# Boss死亡掉落处理函数
say 被击杀！终末之斧已掉落

# 在Boss死亡位置召唤发光的下界合金斧，位置在末地0 100 0
execute in minecraft:the_end run summon item 0 100 0 {Glowing:1b,Item:{id:netherite_axe,count:1,components:{custom_name:[{"text":"终末之斧","bold":true,"italic":false,"color":"#bb00ff"}],lore:[[{"text":"一击必杀","italic":false,"color":"#ff0000"}]],enchantments:{vanishing_curse:1},attribute_modifiers:[{type:attack_damage,amount:99998,slot:mainhand,id:"base_attack_damage",operation:add_value}],damage:254,max_damage:255,damage_resistant:{types:"#minecraft:dragon_breath"}}},Tags:["super_weapon"]}

# 将发放的掉落物tp到死亡boss位置
execute on passengers run tp @e[type=item,tag=super_weapon] @s

# 播放掉落音效
# execute as @a run playsound minecraft:item.totem.use master @a ~ ~ ~ 1 1
execute at @a run playsound minecraft:item.trident.thunder master @a ~ ~ ~ 1.3 1

# 清除乘客标记实体
execute on passengers run kill @s

# 准备倒计时计分板
scoreboard objectives add bf.timer dummy
# 设置boss重生时间为15秒
scoreboard players set $dm bf.timer 15
# 启动每秒倒计时
schedule function main:6_deathmatch/boss/respawn_countdown 1s
