$fn = 100;

width = 39;
height = 30;
nupsi_off = 21.5;
nupsi_r = 1.2;

with_end = false;

difference(){
	cube([width + 6, 20, height + 6]);
	difference() {
		translate([3, -0.01, 6]) cube([width, 20.02, height + 0.01]);
		translate([nupsi_off, 15, 6-0.01]) cylinder(r1=nupsi_r, r2=nupsi_r,h=3);
	}
}

if (with_end) {
	translate([0, -12, 0]) union(){
		difference() {
			cube([width + 6, 12.01, height + 6]);
			translate([3, -0.01, 6]) cube([width, 20.02, height + 0.01]);
		}
		cube([12 + 3, 10, 50]);
	}
}
