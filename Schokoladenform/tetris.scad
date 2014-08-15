use <../Write.scad>

giessform = true;

fact = [1.5, 1.5, 1.5];

module keil() {
	translate([0.24,1,-0.1]) scale([0.52,0.5,0.7]) rotate([0,0,0]) scale([1,1.73,1]) cylinder(r1=1, r2=1, h=9.3, $fn=3);
}
module halbkeil() {
	translate([0,0,0]) scale(0.5) rotate([0,0,0]) scale([1,1.73,1]) cylinder(r1=1, r2=1, h=12.2, $fn=3);
}

module stein() {
	difference() {
		translate([-0.001, -0.001, 0]) cube(6.001);
		union() {
			translate([-0.1,0.2,5.8]) rotate([0,90,0]) rotate([0,0,-135]) halbkeil();
			translate([6,5.9,5.7]) rotate([0,-90,0]) rotate([0,0,45]) halbkeil();
			translate([0.1,6,5.7]) rotate([90,0,0]) rotate([0,0,135]) halbkeil();

			translate([5.8,0,5.8]) rotate([-90,0,0]) rotate([0,0,-45]) halbkeil();
		}
	}
}

module tetrisT() {
	difference() {
		union() {
			stein();
			translate([0,6,0]) stein();
			translate([0,12,0]) stein();
			translate([6,6,0]) stein();
		}
		translate([0,5,0]) keil();
		translate([0,11,0]) keil();
	}
}

module tetrisL() {
	difference() {
		union() {
			stein();
			translate([0,6,0]) stein();
			translate([0,12,0]) stein();
			translate([6,0,0]) stein();
		}
		union() {
			translate([0,5,0]) keil();
			translate([0,11,0]) keil();
			translate([6,13,0]) rotate([0,0,180]) keil();
			translate([7,0,0]) rotate([0,0,90]) keil();
		}
	}
}
module tetrisI() {
	difference() {
		union() {
			stein();
			translate([0,6,0]) stein();
			translate([0,12,0]) stein();
			translate([0,18,0]) stein();
		}
		union() {
			translate([0,5,0]) keil();
			translate([0,11,0]) keil();
			translate([0,17,0]) keil();
			translate([6,5,0]) mirror([1,0,0]) keil();
			translate([6,11,0]) mirror([1,0,0]) keil();
			translate([6,17,0]) mirror([1,0,0]) keil();
		}
	}
}
module tetris0() {
	difference() {
		union() {
			stein();
			translate([0,6,0]) stein();
			translate([6,0,0]) stein();
			translate([6,6,0]) stein();
		}
		union() {
			translate([0,5,0]) keil();
			translate([7,0,0]) rotate([0,0,90]) keil();
			translate([5,12,0]) rotate([0,0,-90]) keil();
			translate([12,7,0]) rotate([0,0,180]) keil();
		}
	}
}
module tetrisS() {
	difference() {
		union() {
			stein();
			translate([0,6,0]) stein();
			translate([6,0,0]) stein();
			translate([-6,6,0]) stein();
		}
		union() {
			translate([7,0,0]) rotate([0,0,90]) keil();
			translate([-1,12,0]) rotate([0,0,-90]) keil();
		}
	}
}

module tafel() {
	for (i = [-4 : 3]) {
		translate([i * 20 + 2, -42, 0]) scale(fact) tetris0();
	}
	for (i = [-2 : 1]) {
		translate([i * 40 + 2, -13, 0]) scale(fact) rotate([0, 0, -90]) tetrisI();
		translate([i * 40 + 2, -2, 0]) scale(fact) rotate([0, 0, -90]) tetrisI();
	}

	translate([-78, 4, 0]) scale(fact) tetrisT();
	translate([-66, 24, 0]) scale(fact) mirror([0, 0, 0]) tetrisS();
	translate([-58, 20, 0]) scale(fact) mirror([0, 1, 0]) tetrisS();
	translate([-20, 0, 0]) scale(fact) rotate([0, 0, 90]) tetrisT();
	translate([-46, 42, 0]) scale(fact) rotate([0, 0, -90]) tetrisL();
	translate([-8, 22, 0]) scale(fact) rotate([0, 0, 90]) tetrisL();
	translate([-18, 2, 0]) scale(fact) mirror([0, 0, 0]) tetrisS();
	translate([-6, 42, 0]) scale(fact) mirror([0, 1, 0])  tetrisL();
	translate([14, 40, 0]) scale(fact) mirror([0, 1, 0]) tetrisS();
	translate([29, 0, 0]) scale(fact) rotate([0, 0, 90]) tetrisT();
	translate([43, 11, 0]) scale(fact) mirror([1, 0, 0])  tetrisL();
	translate([58, 0, 0]) scale(fact) rotate([0, 0, 90])  tetrisL();
	translate([72, 38, 0]) scale(fact) rotate([0, 0, 90]) mirror([1, 0, 0])  tetrisT();
	translate([78, 0, 0]) scale(fact) mirror([1, 0, 0])  tetrisL();
}

module giessform(){
	translate([0,0,6.1]) difference() {
		cube([166,92,13], center=true);
		translate([0,0,0.5]) cube([162,88,13], center=true);
	}
	translate([65,41.5,0.2]) scale([0.8,0.8,1])
		rotate([-90,180,0]) writecube("GPN/CCCD v1.0", [0,0,0], 0);
}

module alles(){
	union(){
		tafel();
		if (giessform){
			giessform();
		}
	}
}

alles();

// small version
//difference() {
//	union(){
//		alles();
//		translate([82, 0, 6.1]) cube([162,90,14], center=true);
//	}
//	translate([84, 0, 6.1]) cube([162,91,15], center=true);
//}
