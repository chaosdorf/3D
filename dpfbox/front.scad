$fn=20;


module alles(){
	display = [64.4,50,9.5];  // Größte Aussenmaße
	cube(display+[4,4,2]);
}

module anzeige(){
	translate([9.3,7.5,0]) cube([51.7,40,20]);
	translate([2.8,5.7,1]) cube([60.2,42.7,20]);
}

module platine(){
	difference(){ //Bolzen zum Festhalten der Platine
		translate([2,2,4.5]) cube([64.4,50,20]);
		translate([3.5,3.5,4]) cylinder(h=2, r=0.5);
		translate([3.5,50.2,4]) cylinder(h=2, r=0.5);
		translate([64,3.5,4]) cylinder(h=2, r=0.5);
		translate([64,50.2,4]) cylinder(h=2, r=0.5);
	}
	translate([64.5,22.5,5.3]) cube([5,8,10]); //USB-Port
}


difference() {
	alles();
	anzeige();
	platine();
}