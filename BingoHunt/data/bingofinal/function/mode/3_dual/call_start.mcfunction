tellraw @a {"text":"[3_dual] call_start begin (2t)","color":"aqua"}
function bingofinal:mode/3_dual/start_step1_setup
tellraw @a {"text":"[3_dual] call_start after step1","color":"aqua"}
function bingofinal:mode/3_dual/start_step2_pick
tellraw @a {"text":"[3_dual] call_start after step2","color":"aqua"}
function bingofinal:mode/3_dual/start_step3_place
# 基地生成完成后，请手动执行：/function bingofinal:random_team_3
 tellraw @a {"text":"[3_dual] 基地就绪。请执行 /function bingofinal:random_team_3 分配身份与开始对局","color":"gold"}
 tellraw @a {"text":"[3_dual] call_start end","color":"aqua"} 