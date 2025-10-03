summon item ~ ~1 ~ {Glowing:1b,Item:{id:netherite_axe,count:1,components:{custom_name:[{"text":"终末之斧","bold":true,"italic":false,"color":"#bb00ff"}],lore:[[{"text":"一击必杀","italic":false,"color":"#ff0000"}]],enchantments:{vanishing_curse:1},attribute_modifiers:[{type:attack_damage,amount:99998,slot:mainhand,id:"base_attack_damage",operation:add_value}],damage:254,max_damage:255,damage_resistant:{types:"#minecraft:dragon_breath"}}}}

summon shulker ~ ~ ~ {Color:10,CustomName:[{text:"终末母体",bold:true,color:"#9900cc"}],CustomNameVisible:1b,Health:100,Glowing:1b,PersistenceRequired:1b,Tags:["boss"],attributes:[{id:max_health,base:100f}]}

summon shulker ~ ~ ~ {Color:10,CustomName:[{text:"终末母体",bold:true,color:"#9900cc"}],CustomNameVisible:1b,Health:100,Glowing:1b,PersistenceRequired:1b,Tags:["boss"],attributes:[{id:max_health,base:100f}],Passengers:[{id:"minecraft:marker",Tags:["death_detector"]}]}

playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1
playsound minecraft:item.trident.thunder master @a ~ ~ ~ 1
playsound minecraft:item.totem.use master @a ~ ~ ~ 0.5
playsound minecraft:item.goat_horn.sound.1 master @a ~ ~ ~ 1 0.5
playsound minecraft:item.mace.smash_ground_heavy master @a ~ ~ ~ 1 0.5
playsound minecraft:block.bell.use master @a ~ ~ ~ 1 0.5
playsound minecraft:block.note_block.bell master @a ~ ~ ~ 1
playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1
playsound minecraft:block.note_block.harp master @a ~ ~ ~ 1
playsound minecraft:block.note_block.bass master @a ~ ~ ~ 1
playsound minecraft:entity.enderman.teleport master @a ~ ~ ~ 1.5
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 1