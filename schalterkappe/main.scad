laenge = 24;
breite = 19;
hoehe = 8;
rand = 3;

difference(){
	cube([laenge+2*rand,breite+2*rand,hoehe+rand]);
	translate([rand, rand, rand]) cube([laenge, breite, hoehe]);
}