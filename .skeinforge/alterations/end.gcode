M104 S0 ; turn off temperature
M140 S0 ; turn bed temp off
G92 Z0 ; reset Z
G1 Z1 ; move nozzle 1mm up
G1 X0 Y205 F6000 ; home X axis & move bed forward
M105 ; Read current temp
M84     ; disable motors
G92 E0 ; reset extruder
G92 X0 ; reset x
G92 Y0 ; reset Y
G92 Z0 ; reset Z