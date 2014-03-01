module rcylinder(r1=10,r2=10,h=5,b=2)
{translate([0,0,-h/2]) hull(){rotate_extrude() translate([r1-b,b,0]) circle(r = b); rotate_extrude() translate([r2-b, h-b, 0]) circle(r = b);}}

module rcube(Size=[20,20,20],b=2)
{hull(){for(x=[-(Size[0]/2-b),(Size[0]/2-b)]){for(y=[-(Size[1]/2-b),(Size[1]/2-b)]){for(z=[-(Size[2]/2-b),(Size[2]/2-b)]){ translate([x,y,z]) sphere(b);}}}}}

top=0;
bottom=0;
module plug(d,h){
		union(){	
		translate([0,0,1.4]){
			cylinder(r1=d/2+0,r2=5,h=(3/4)*h,$fn=100);
		}
		translate([0,0,((3/4)*h)+0.4]){
			sphere(5.1,$fn=100,center=true);
		}
		translate([0,0,0]) rcylinder(h=5,r1=d/2,r2=d/2,$fn=100,cent);	
		translate([0,0,-((1/3)*h)-9.2]){
			cylinder(r2=d/2,r1=(d/2)*0.3,h=(3/7)*h,$fn=100);
		}	
		translate([0,0,-((1/3)*h)-36.8]) cylinder(r=d/2*0.5,h=40, $fn=100);
		translate([0,0,-((1/3)*h)-41.7]) rcube(Size=[d,d/,10], $fn=10);
		}
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

d=70;
h=100;
plug(d,h);