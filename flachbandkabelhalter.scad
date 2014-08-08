difference() {
	union() {
		cube([7,20,1]);
		translate([0,10,2.8]) cube([7,10,1]);
		translate([0,18.5,0]) cube([7,1.5,3]);
	}
	translate([2, 2, -0.01]) cube([3.2, 4, 3.1]);
}
