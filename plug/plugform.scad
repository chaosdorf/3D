module rcylinder(r1=10,r2=10,h=5,b=2){ //creates cylinder with round corners and edges
	translate([0,0,-h/2]) hull(){
		rotate_extrude() translate([r1-b,b,0]) circle(r = b);
		rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);
	}
}

module rcube(Size=[20,20,20],b=2){ //creates cube with round corners and edges
	hull(){
		for(x=[-(Size[0]/2-b),(Size[0]/2-b)]){
			for(y=[-(Size[1]/2-b),(Size[1]/2-b)]){
				for(z=[-(Size[2]/2-b),(Size[2]/2-b)]){
					translate([x,y,z]) sphere(b);
				}
			}
		}
	}
}

module plug(d,h,sd,sh,rf,f){
		hull(){	
			translate([0,0,0]) cylinder(r1=d/2,r2=5,h=h,$fn=f);
			translate([0,0,h]) sphere(5,$fn=f,center=true);
			sphere(d/2, $fn=f);
			translate([0,0,-d/2]) cylinder(r1=d/4,r2=d/3,h=d/4, $fn=f);
		}
		translate([0,0,-sh-d/2]) cylinder(r=sd/2,h=sh+d/2, $fn=f);
		if (rf) {
			scale([1,0.8,1]) translate([0,0,-sh-d/2])
				rcylinder(h=10,r1=d/2+4,r2=d/2+4,$fn=f,center=true);
		}
		else {
			translate([0,0,-sh-d/2]) rcube(Size=[d+6,sd+10,10], $fn=f);
		}
}


module negative(d,h,sd,sh,rf,f,hs){
	cs = hs - 2; // work around 3D printer inaccuracies and foo (cubes should be smaller than their respective holes)

	translate([0.5*d+8,0,0])rotate([-90,0,0]) difference(){
		rotate([0,180,0])translate([-d/2-5,0,-h-10.5]){
			cube(size=[d+10,d/2+5,h+sh+d/2+15]);
		}
		union(){
			plug(d,h,sd,sh,f);
			translate([d/2-hs,-hs/2,-d/2-sh/4]){
				cube(size=[hs,hs,hs]);
			}
			translate([-d/2,-hs/2,-d/2-sh/4]){
				cube(size=[hs,hs,hs]);
			}
			translate([d/2-hs,-hs/2,h]){
				cube(size=[hs,hs,hs]);
			}
			translate([-d/2,-hs/2,h]){
				cube(size=[hs,hs,hs]);
			}
		}
	}
	translate([-0.5*d-8,0,0])rotate([-90,0,0]) union(){
		difference(){
			rotate([0,180,0])translate([-d/2-5,0,-h-10.5]){
				cube(size=[d+10,d/2+5,h+sh+d/2+15]);
			}
			plug(d,h,sd,sh,f);
		}
		// we need to substract/add 1 because of cs = hs - 2
		translate([d/2-hs+1,-cs/2,-d/2-sh/4+1]){
			cube(size=[cs,cs,cs]);
		}
		translate([-d/2+1,-cs/2,-d/2-sh/4+1]){
			cube(size=[cs,cs,cs]);
		}
		translate([d/2-hs+1,-cs/2,h+1]){
			cube(size=[cs,cs,cs]);
		}
		translate([-d/2+1,-cs/2,h+1]){
			cube(size=[cs,cs,cs]);
		}
	}
}

d=70; //diameter of thickest part of head (must be >= 40)
h=100;//height of upper part of head (don't go under 30)
sd=0.6*d; //diameter of shaft (d/2 <= sd <= d-20)
sh=40; //length of shaft (must be >= 10)
f=10; //higher value means higher resolution(around 100 should be high enough)
hs=8; //size of the negative's positioning holes. There should be no need to change this.
rf=true; //set to true for a round foot. Recommended when using soft silicone <= 8 ShA.

positive=false; //set to true to view the plug (as in, the positive)

if (positive) {
	plug(d,h,sd,sh,rf,f);
}
else {
	negative(d,h,sd,sh,rf,f,hs);
}