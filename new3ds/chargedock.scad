// New 3DS XL charging dock (device cannot be used while in it)
// beta - has lots of room for improvement

outer_w = 72.6;
outer_spacing = 68;
contact_w = 2.5;
contact_h = 3.5;
contact_spacing = 10.2;
inner_w = 5.1;
w = 160 + 2;
h = 21.15 + 1.5;

shell = 2;

inner_spacing = w - (2 * outer_spacing);
contact_x = outer_w;
contact_y = h - contact_h;

difference(){
	translate([-shell, -shell, -10]) cube([w+(2*shell), h+(2*shell), 40+9.9]);
	cube([w, h, 40]);
	translate([0, 0, -11]) cube([outer_spacing, h, 12]);
	translate([w-outer_spacing, 0, -11]) cube([outer_spacing, h, 12]);
	translate([outer_spacing+2, -shell-0.01, -11]) cube([inner_spacing/2-4, h, 6]);
	translate([outer_spacing+2+inner_spacing/2, -shell-0.01, -11]) cube([inner_spacing/2-4, h, 6]);
	translate([outer_w + 1.5, h - contact_h - 1, 0]) rotate([20+90, 0, 0]) cube([3, 3, 20]);
	translate([outer_w + 1.5 + contact_spacing, h - contact_h - 1, 0]) rotate([20+90, 0, 0]) cube([3, 3, 20]);
}
