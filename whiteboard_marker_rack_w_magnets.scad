// Originating from Amy Hurst's Model (2011, Feb, 18)
// http://www.thingiverse.com/thing:6502
// Modified to hold neodym disc magnets (d x h = 6 x 4 mm)
// And dynamically vary the number of pens to hold
// by @PlantProgrammer (2014, Sep, 29)


numberOfPens =4;
radius = (18) / 2;
length = 23.3333333 * numberOfPens;
height = radius * 2;
$fn= 150;
//$fn= 15;

module rack(){
	rotate([90,0,0]){
		difference(){
	
			cube([length,10,height],center = true);

			for (i = [-((numberOfPens/2)-0.5):((numberOfPens/2))]){
				color([100,0,0])rotate([90,0,0])translate([(radius*i) * 2.5,radius * 0.6,0])cylinder(h = 15, r = radius, center = true);
			}
		}//end difference
	}//rotate
}
module magnetHoles(){
	step=(numberOfPens%2==1) ? 2 : numberOfPens-1;
	for (i = [-((numberOfPens/2)-0.5):step:((numberOfPens/2))]){
		rotate([90,0,0]) translate([radius*(i)*2.5,0,-4.1]) cylinder(h=5, r=6/2,center=true);
	}
}
difference(){
	rack();
	magnetHoles();
}

