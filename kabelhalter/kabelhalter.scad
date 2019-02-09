// Kabeldurchmesser - 5%
wire = 5.2;
// Anzahl der gehaltenen Kabel
//number = 3;
height = 10;
depth = 16;
distance = 20;

$fn=50;

difference(){
    cube([number*distance, depth, height]);
    for (i = [1:number]){
        translate([(distance*i)-distance/2-wire/2, 0, 0]) cube([wire, depth/2, height]);
        translate([(distance*i)-distance/2, depth/2, 0]) cylinder(d=wire, h=height);
    }
}
