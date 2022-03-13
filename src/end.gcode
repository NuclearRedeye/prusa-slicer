G4 ; wait
G1 E-10 ; Retract filament by 10mm to avoid oozing during cool down
G4 ; wait for retraction to finish
M221 S100 ; reset flow
M900 K0 ; reset LA
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3|@0.25 nozzle MK3).*/}M907 E538 ; reset extruder motor current{endif}
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
{if max_layer_z < max_print_height}G1 Z{z_offset+min(max_layer_z+30, max_print_height)}{endif} ; Move print head up
G1 X0 Y200 F3000 ; home X axis
M84 ; disable motors