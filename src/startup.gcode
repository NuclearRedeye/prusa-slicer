M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.10.0 ; tell printer latest fw version
G90 ; use absolute coordinates
M83 ; extruder relative mode
M104 S170 ; Set extruder temp for mesh leveling
M140 S[first_layer_bed_temperature] ; Set bed temp for mesh leveling
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S170 ; wait for extruder temp
G28 W ; home all without mesh bed level
G80 ; mesh bed leveling
M190 S[first_layer_bed_temperature] ; Heat and wait for bed to reach print temp
M109 S[first_layer_temperature] ; Heat and wait for extruder to reach print temp
G1 Z0.2 F720
G1 Y-3 F1000 ; go outside print area
G92 E0
G1 X120 E18 F1000 ; intro line
G1 X180 E12.5 F1000 ; intro line
G92 E0
M221 S{if layer_height<0.075}100{else}95{endif}

; Don't change E values below. Excessive value can damage the printer.
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3).*/}M907 E430 ; set extruder motor current{endif}
{if print_settings_id=~/.*(SPEED @MK3|DRAFT @MK3).*/}M907 E538 ; set extruder motor current{endif}