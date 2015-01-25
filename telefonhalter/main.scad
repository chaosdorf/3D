$fn=50;

difference(){
	cube([10,37,20]);
	cube([5,20,20]);
	translate([5,25,0]) cube([5,12,20]);
	translate([10.05,10,10]) rotate([0,-90,0]) cylinder(h=5.1, d1=4, d2=7);
}