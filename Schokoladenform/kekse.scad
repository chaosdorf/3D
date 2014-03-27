use <../Write.scad>

// set your desired logo here. See below for supported logo functions
module logo(){
	logo_chaosknoten();
	//logo_cthulhu();
	//logo_fillin();
	//logo_usbknoten();
}

// piece width and height - not fully supported yet, do not change
pch=55;
pcw=66;

module logo_chaosknoten(){
	translate([5.7,-6,1.6]) scale([7,7,1]) rotate([0,0,90])
		linear_extrude(height = 1, center = true, convexity = 10)
		import (file = "chaosknoten.dxf");
}

module logo_cthulhu(){
	translate([-33.5,-8.1,1.6]) scale([1.1,1.1,1]) rotate([0,0,0])
		linear_extrude(height = 1, center = true, convexity = 10)
		import (file = "cthulhu.dxf");
}

module logo_usbknoten(){
	translate([5.7,-6,1.6]) scale([7,7,1]) rotate([0,0,90])
		linear_extrude(height = 1, center = true, convexity = 10)
		import (file = "usbknoten.dxf");
}

module logo_fillin(){
	difference() {
		translate([-37.4,-10.4,1.5]) cube([pch-5.2,pcw-5.2,0.2]);
		translate([-37.2,-10.2,1.4]) cube([pch-5.6,pcw-5.6,0.5]);
	}
}

module tafel(){
	difference() {
		translate([0,0,2.75]) cube([4*pch,pcw,9.5], center=true);
		for (i = [-2:2]){
			translate([i*pch,0,8]) rotate([90,90,0]) cylinder(h=pcw, r=5, center=true, $fn=3);
		}
		for (i = [-1,1]){
			translate([0,i*pcw/2,8]) rotate([0,90,0]) cylinder(h=4*pch, r=5, center=true, $fn=3);
		}
	}
	for (i = [-1:2]){
		translate([i*pch-15,-20,6]) logo();
	}
}

module giessform(){
	translate([0,0,4.1]) difference() {
		cube([4*pch+12,pcw+10,13], center=true);
		translate([0,0,1]) cube([4*pch+10,pcw+8,12.5], center=true);
	}
	translate([pch*1.7,35,-1.4]) scale([0.8,0.8,1])
		rotate([-90,180,0]) writecube("CCCD v1.2", [0,0,0], 0);
}

module alles(gf){
	union(){
		tafel();
		if (gf){
			giessform();
		}
	}
}


alles(true);
