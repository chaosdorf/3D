$fn = 100;

rpix = 58;
rpiy = 49;
rpiz = 17;

rpiri = 1;
rpiro = 3;

buf = 5;

module mount(x,y){
	translate([x,y,0]) union(){
		cylinder(r1=rpiro, r2=rpiro, h=rpiz);
		translate([0, 0, rpiz-0.01]) cylinder(r1=rpiri, r2=rpiri, h=buf+0.01);
	}
}

translate([3, 3, 2]) union(){
	mount(0, 0);
	mount(0, rpiy);
	mount(rpix, 0);
	mount(rpix, rpiy);
}
cube([2 * rpiro + rpix, 2 * rpiro, 2.01]);
translate([0, rpiy, 0]) cube([2 * rpiro + rpix, 2 * rpiro, 2.01]);
cube([2 * rpiro, 2 * rpiro + rpiy, 2.01]);
translate([rpix, 0, 0]) cube([2 * rpiro, 2 * rpiro + rpiy, 2.01]);
