module triforce(high,dia){
	difference() {
		cylinder(h=high, r1=dia, r2=dia*4/5, $fn=3);
		rotate([0,0,180]) cylinder(h=high, r2=dia*2/5, r1=dia*3/10, $fn=3);
	}
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
		cube([170,70,15], center=true);
		translate([0,0,1.26]) cube([160,60,12.5], center=true);
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
				translate([j*15+6.5,i*12.5,6]) triforce(2,5);
			}
		}
	}
}

alles(true);