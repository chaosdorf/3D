$fn=20;

rotate([90,0,0])
union(){
cube([75,20,5]);
cube([5,20,10]);
translate([29+5,0,0]) cube([10,20,50+5]);
}
