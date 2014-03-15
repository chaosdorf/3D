module chaosknoten(){
	translate([5.7,-6,1.6]) scale([7,7,1]) rotate([0,0,90])
		linear_extrude(height = 1, center = true, convexity = 10)
		import (file = "chaosknoten.dxf");
}

module tafel(){
	difference() {
		translate([0,0,2.75]) cube([4*55,66,9.5], center=true);
		for (i = [-2:2]){
			translate([i*55,0,8]) rotate([90,90,0]) cylinder(h=64, r=5, center=true, $fn=3);
		}
		for (i = [-1,1]){
			translate([0,i*33,8]) rotate([0,90,0]) cylinder(h=4*55, r=5, center=true, $fn=3);
		}
	}
	for (i = [-1:2]){
		translate([i*55-15,-20,6]) chaosknoten();
	}
}

module giessform(){
	translate([0,0,4.1]) difference() {
		cube([4*55+15,64+15,15], center=true);
		translate([0,0,1.26]) cube([4*55+10,64+10,12.5], center=true);
	}
}

module alles(gf){
	union(){
		tafel();
		if (gf){
			giessform();
		}
	}
}


alles(true);