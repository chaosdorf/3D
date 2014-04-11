// Cooling tower for dreikraftschoki silicone molds. Place the filled molds
// in it, then put it into the fridge.

module unit() {
	difference() {
		union(){
			cube([160 + 10, 60 + 4, 15 + 2]);
			translate([2, -0.01, 17]) cube([1.5, 1.5, 1.5]);
			translate([2, 62.51, 17]) cube([1.5, 1.5, 1.5]);
			translate([166, -0.01, 17]) cube([1.5, 1.5, 1.5]);
			translate([166, 62.51, 17]) cube([1.5, 1.5, 1.5]);
		}
		translate([2, 2, 2.01]) cube([160 + 6, 60, 15]);
		translate([2, -0.01, -0.01]) cube([1.5, 1.5, 1.5]);
		translate([2, 62.51, -0.01]) cube([1.5, 1.5, 1.5]);
		translate([166, -0.01, -0.01]) cube([1.5, 1.5, 1.5]);
		translate([166, 62.51, -0.01]) cube([1.5, 1.5, 1.5]);
		translate([-0.01,32,4]) rotate([26,0,0]) cube([4,66,66]);
		translate([-0.01,32,4]) rotate([90-26,0,0]) cube([4,66,66]);
		translate([167.99,32,4]) rotate([26,0,0]) cube([4,66,66]);
		translate([167.99,32,4]) rotate([90-26,0,0]) cube([4,66,66]);
		translate([32,-0.01,4]) rotate([0,-90+27,0]) cube([66,4,66]);
		translate([32,-0.01,4]) cube([106,4,66]);
		translate([170-32,-0.01,4]) rotate([0,-27,0]) cube([66,4,66]);
		translate([32,61.99,4]) rotate([0,-90+27,0]) cube([66,4,66]);
		translate([32,61.99,4]) cube([106,4,66]);
		translate([170-32,61.99,4]) rotate([0,-27,0]) cube([66,4,66]);
		for (i = [0:5]) {
			for (j = [0:1]) {
				translate([25 * i + 10,24 * j + 10,-0.01]) cube([22,20,4]);
			}
		}
	}
}

unit();
