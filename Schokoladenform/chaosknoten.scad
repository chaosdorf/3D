module chaosknoten(){
	translate([5.7,-6,1.5]) scale([1.75,1.75,1]) rotate([0,0,90])
		linear_extrude(height = 1, center = true, convexity = 10)
		import (file = "chaosknoten.dxf");
}

module tafel(){
	difference() {
		translate([0,0,3.75]) cube([150,50,7.5], center=true);
		for (i = [-5:5]){
			translate([i*15,0,8]) rotate([90,90,0]) cylinder(h=51, r=5, center=true, $fn=3);
		}
		for (i = [-1:1]){
			translate([0,i*25,8]) rotate([0,90,0]) cylinder(h=151, r=5, center=true, $fn=3);
		}
	}
}

module giessform(){
	translate([0,0,5.1]) difference() {
		cube([160,60,15], center=true);
		translate([0,0,1.26]) cube([155,55,12.5], center=true);
	}
}

module alles(gf){
	union(){
		tafel();
		if (gf){
			giessform();
		}
		for (i= [-1,1]){
			for (j = [-5:4]){
				translate([j*15+6.5,i*12.5,6]) chaosknoten();
			}
		}
	}
}


scale([1.5,1.5,1]) alles(true);