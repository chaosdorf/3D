G28 ; home all 
G90 ;
G92 E0 ; reset extruder
G92 X0 ; reset x
G92 Y0 ; reset Y
G92 Z0 ; reset Z
G90 ;
G21 ; use mm
G1 X20 Y20 Z0.3 F1000
G1 X200 Y20 Z0.3 F2000 E25
G1 X200 Y25 Z0.3 F2000 E25
G1 X0 Y25 Z0.3 F1000 E50
G1 E48
G92 E0
