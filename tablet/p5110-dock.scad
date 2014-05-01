// Stecker: 26.8 x 7.0 x 10.7 mm
// Knickschutz: ∅ 4.5mm
// Kabel: ∅ 3.3mm

// Tablet: 280mm x 10mm x 180mm

// rough estimation, used for positioning tests
module tablet() {
	cube([280,12, 180]);
}

// not-so-rough estimation, used for positioning tests
module cable() {
	translate([2, 2, 10.7]) cube([22.8,3,5]);
	cube([26.8, 7, 10.7]);
	translate([26.8/2, 7/2, -10]) cylinder(r1=2.25, r2=2.25, h=10.1, $fn=100);
}

//translate([5,50 + 7/2,9]) rotate([-20, 0, -90]) tablet();

module stand() {
	difference() {
		union() {
			translate([0,0,-20]) cube([44,60,25]);
			translate([0,0,-20]) cube([85,20,2]);
			translate([0,40,-20]) cube([85,20,2]);
			cube([5,60,12]);
			translate([29+5,0,0]) cube([10,20,50+5]);
			translate([29+5,40,0]) cube([10,20,50+5]);
		}
		translate([3,40 + 7/2,-2]) rotate([-20, 0, -90]) scale([1.01, 1.01, 1.01]) cable();
		translate([4,30, -21]) cube([10,4.5,80], center = true);
	}
}

stand();

//rotate([90,0,0])
//union(){
//cube([75,20,5]);
//cube([5,20,10]);
//translate([29+5,0,0]) cube([10,20,50+5]);
//}
