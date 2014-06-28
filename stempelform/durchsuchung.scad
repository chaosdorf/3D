scale([1,1,0.4]) difference(){
	cube([4.75,1.25,0.5]);
	translate([0.25/2,0.25/2,0.3]) cube([4.5,1,0.201]);
	#translate([0.2,0.1,0.1]) linear_extrude(height = 0.2, convexity = 10) import(file = "durchsuchung.dxf");
}

