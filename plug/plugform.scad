module rcylinder(r1=10,r2=10,h=5,b=2)
{translate([0,0,-h/2]) hull(){rotate_extrude() translate([r1-b,b,0]) circle(r = b); rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);}}

module rcube(Size=[20,20,20],b=2)
{hull(){for(x=[-(Size[0]/2-b),(Size[0]/2-b)]){for(y=[-(Size[1]/2-b),(Size[1]/2-b)]){for(z=[-(Size[2]/2-b),(Size[2]/2-b)]){ translate([x,y,z]) sphere(b);}}}}}

top=0;
bottom=0;
module plug(d,h,s,f){
		hull(){	
			translate([0,0,0]) cylinder(r1=d/2,r2=5,h=h,$fn=f);
			translate([0,0,h]) sphere(5.1,$fn=f,center=true);
			//translate([0,0,0]) rcylinder(h=5,r1=d/2,r2=d/2,$fn=f,cent);	
			sphere(d/2, $fn=f);
			translate([0,0,-d/2]) cylinder(r1=d/4,r2=d/3,h=10, $fn=f);
		}
		translate([0,0,-d]) cylinder(r=d/4,h=s, $fn=f);
		translate([0,0,-d]) rcube(Size=[d,d/2,10], $fn=f);
}


module negative(d,h){

	translate([d+15,0,0])rotate([-90,90,0]) 
	difference(){
	translate([0,-d-10,-((1/3)*h)-46]) cube(size=[d+10,d*2+20,top+bottom+20]);
	plug(d,h);
	}
	translate([-d-15,0,0])rotate([-90,-90,0])
	difference(){
	translate([-d-10,-d-10,-((1/3)*h)-46]) cube(size=[d+10,d*2+20,top+bottom+20]);
	plug(d,h);
	}
	
}

d=70; //diameter of thickest part of head
h=100;//height of upper part of head
s=40; //length of shaft
f=10; //higher value means higher resolution(around 100 should be high enough)
plug(d,h,s,f);