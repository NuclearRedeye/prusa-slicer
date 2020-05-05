G4 ; wait
M221 S100
M140 S0 ; turn off heatbed
G1 E-10 ; Retract filament by 10mm to avoid ooze during hot end cool down
G4 ; wait for retraction to finish
M104 S0 ; turn off temperature
M107 ; turn off fan
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+30, max_print_height)}{endif} ; Move print head up
G1 X0 Y200 F3000 ; home X axis
M84 ; disable motors