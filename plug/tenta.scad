scale=3.0;

foot = false;

// end of configuration

spacing = foot ?   2.5*scale : 4;
boxheight = foot ? 47.5 : 52.5;

module boundingboxl(){
	if (foot) {
		difference(){
			union(){
				translate([0,-7.5,-5.1]) cube([7.5,15.5,57.5]);
				intersection(){
					translate([0,-11.5,-5.1]) cube([7.5,23.5,20]);
					translate([0,-7.5,-20.2]) rotate([16,0,0]) cube([7.5,24.5,37]);
					translate([0,-14.5,-10]) rotate([-16,0,0]) cube([7.5,24,37]);
				}
			}
			translate([0,0.2,-5.2]) scale([0.62,1,1]) cylinder(r1=11.5,r2=11.5,h=5.3,$fn=100);
		}
	}
	else {
		translate([0,-7.5,0.1]) cube([7.5,15.5,52.5]);
	}
}

module boundingboxr(){
	if (foot) {
		difference(){
			union(){
				translate([-7.5,-7.5,-5.1]) cube([7.5,15.5,57.5]);
				intersection(){
					translate([-7.5,-11.5,-5.1]) cube([7.5,23.5,20]);
					translate([-7.5,-7.5,-20.2]) rotate([16,0,0]) cube([7.5,24.5,37]);
					translate([-7.5,-14.5,-10]) rotate([-16,0,0]) cube([7.5,24,37]);
				}
			}
			translate([0,0.2,-5.2]) scale([0.62,1,1]) cylinder(r1=11.5,r2=11.5,h=5.3,$fn=100);
		}
	}
	else {
		translate([-7.5,-7.5,0.1]) cube([7.5,15.5,52.5]);
	}
}

module moldl(){
	difference(){
		boundingboxl();
		union(){
			import("makies_tentacle.stl");
			translate([0,0.7,0]) cylinder(r1=5,r2=4.1,h=20,$fn=100);
			translate([-0.1,-5,40]) cube([1,2,10]);
			translate([-0.1,7,17]) cube([1,2,11]);
		}
	}
}

module moldr(){
	union(){
		difference(){
			boundingboxr();
			union(){
				import("makies_tentacle.stl");
				translate([0,0.7,0]) cylinder(r1=5,r2=4.1,h=20,$fn=100);
			}
		}
		translate([-0.1,-5.05,40.05]) cube([0.95,1.9,9.9]);
		translate([-0.1,7.05,17.05]) cube([0.95,0.95,10.9]);
	}
}

translate([-8*scale-spacing,0,7.5*scale]) scale([scale,scale,scale])
	rotate([90,90,0]) moldl();
translate([8*scale+spacing,-boxheight*scale,7.5*scale])  scale([scale,scale,scale])
	rotate([90,-90,180]) moldr();

// use for alignment testing
//translate([0,0,7.5*scale]) scale([scale,scale,scale])
//	rotate([90,180,0]) moldl();
//translate([0,0,7.5*scale])  scale([scale,scale,scale])
//	rotate([90,180,0]) moldr();
