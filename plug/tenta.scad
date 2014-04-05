scale=3.0;

module moldl(){
	difference(){
		translate([0,-7,0.1]) cube([7.5,15,52.5]);
		union(){
			import("makies_tentacle.stl");
			translate([0,0.7,0]) cylinder(r1=5,r2=4.1,h=20,$fn=100);
			translate([-0.1,-5,40]) cube([1,2,10]);
			translate([-0.1,7,13]) cube([1,2,15]);
		}
	}
}

module moldr(){
	union(){
		difference(){
			translate([-7.5,-7.5,0.1]) cube([7.5,15.5,52.5]);
			union(){
				import("makies_tentacle.stl");
				translate([0,0.7,0]) cylinder(r1=5,r2=4.1,h=20,$fn=100);
			}
		}
		translate([-0.1,-5.05,40.05]) cube([0.95,1.9,9.9]);
		translate([-0.1,7.05,13.05]) cube([0.95,0.95,14.9]);
	}
}

translate([-8*scale-4,0,7.5*scale]) scale([scale,scale,scale])
	rotate([90,90,0]) moldl();
translate([8*scale+4,0,7.5*scale])  scale([scale,scale,scale])
	rotate([90,-90,0]) moldr();
