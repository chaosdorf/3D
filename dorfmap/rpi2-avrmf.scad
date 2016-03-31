$fn = 100;

rpix = 58;
rpiy = 49;
rpiz = 17;

rpiri = 1;
rpiro = 3;

buf = 10;

module mount(x,y){
	translate([x,y,-1]) cylinder(r1=rpiri+0.1, r2=rpiri+0.1, h=buf+0.01);
}

difference(){
	translate([0, -2, 0]) cube([rpix, rpiy+4, buf-1]);
	translate([4, -0.5, 1.01]) cube([50, 50, buf-1]);
	mount(0, 0);
	mount(0, rpiy);
	mount(rpix, 0);
	mount(rpix, rpiy);
}
