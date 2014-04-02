module stamp_cccac(){
	union(){
		// Grundplatte
		translate([0,0,-0.3]) cube([9.5,7.6,0.3]);

		// Logo
		linear_extrude(height = 1, convexity = 10)
			import(file = "cccac.dxf");

		// Form
		difference(){
			translate([-0.1,-0.1,-0.3]) cube([9.7,7.8,4.9]);
			translate([0,0,-0.3]) cube([9.5,7.6,10]);
		}
	}
}

scale([3,3,1]) stamp_cccac();
