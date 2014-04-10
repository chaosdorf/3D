// Cooling tower for dreikraftschoki silicone molds. Place the filled molds
// in it, then put it into the fridge.

capacity = 5;

module tower() {
	difference() {
		cube([160 + 10, 60, 15 * capacity + 2]);
		for (i = [0 : capacity-1]) {
			translate([2, 2, 15 * i + 2]) cube([160 + 6, 60, 13]);
		}
	}
}

rotate([90,0,0]) tower();
