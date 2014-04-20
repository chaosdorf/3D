// Cooling tower for dreikraftschoki silicone molds. Place the filled molds
// in it, then put it into the fridge.

angles = 26;
anglew = 30;

// inner dimensions
dx = 160;
dy = 60;
dz = 15;

// offsets
ox = 10;
oy = 4;
oz = 2;

// outer dimensions
bx = dx + ox;
by = dy + oy;
bz = dz + oz;

module unit() {
	difference() {
		union(){
			cube([bx, by, bz]);
			translate([2, 0, bz]) cube([4.95, 1.9, 1.45]);
			translate([2, dy + oy/2 + 0.1, bz]) cube([4.95, 1.9, 1.45]);
			translate([bx - 7, 0, bz]) cube([4.95, 1.9, 1.45]);
			translate([bx - 7, dy + oy/2 + 0.1, bz]) cube([4.95, 1.9, 1.45]);
		}
		translate([2, 2, 2.01]) cube([dx + 6, dy, dz]);
		translate([2, -0.01, -0.01]) cube([5, 2, 1.5]);
		translate([2, by - 1.49, -0.01]) cube([5, 2, 1.5]);
		translate([bx-7, -0.01, -0.01]) cube([5, 2, 1.5]);
		translate([bx-7, by - 0.49, -0.01]) cube([5, 2, 1.5]);
		translate([-0.01,by/2, 4]) rotate([angles,0,0]) cube([4,66,66]);
		translate([-0.01,by/2, 4]) rotate([90-angles,0,0]) cube([4,66,66]);
		translate([dx+7, by/2, 4]) rotate([angles,0,0]) cube([4,66,66]);
		translate([dx+7, by/2, 4]) rotate([90-angles,0,0]) cube([4,66,66]);
		translate([32,-0.01, 4]) rotate([0,-90+anglew,0]) cube([66,4,66]);
		translate([32,-0.01, 4]) cube([106,4,66]);
		translate([bx-32,-0.01,4]) rotate([0,-anglew,0]) cube([66,4,66]);
		translate([32, by-2.01, 4]) rotate([0,-90+anglew,0]) cube([66,4,66]);
		translate([32, by-2.01, 4]) cube([106,4,66]);
		translate([bx-32, by-2.01, 4]) rotate([0,-anglew,0]) cube([66,4,66]);
		intersection(){
			translate([5,5,-0.11]) cube([dx-10,dy-10,dz+0.2]);
			for (i = [0:20]) {
				for (j = [0:20]) {
					translate([25 * i + 10, 24 * j + 10, -0.01]) cube([22,20,dz+0.2]);
				}
			}
		}
	}
}

unit();
