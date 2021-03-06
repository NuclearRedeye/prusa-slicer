M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.8.1 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M140 S[first_layer_bed_temperature] ; set bed temp
M104 S170 ; Heat Extruder, use lower temp to avoid oozing
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S170 ; wait for extruder temp
G28 W ; home all without mesh bed level
G80 ; mesh bed leveling
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp
G1 Y-3.0 F1000.0 ; go outside print area
G92 E0.0
G1 X60.0 E9.0 F1000.0 ; intro line
G1 X100.0 E12.5 F1000.0 ; intro line
G92 E0.0
M221 S{if layer_height<0.075}100{else}95{endif}