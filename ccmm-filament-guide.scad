/*

Wanhao Duplicator i3 Mini / Cocoon Create Model Maker filament guide

Protects your 3D printer's paint job.

(c) 2018 Matthias Liffers

CC-BY

Licensed under a Creative Commons Attribution 4.0 International Licence

*/

smoothness = 120;

translate([0,0,2])
rotate(a=90, v=[0,1,0])
union() {
    create_mount();
    create_plate();
    create_join();
    create_guide();
}


module create_guide() {
    translate([-30,14,0]){
        create_guide_plate();
        translate([0,5,0])
            create_guide_plate();
    }
}

module create_guide_plate() {
    union() {
        cube([20,2,12]);
        difference(){
            translate([20,2,0])
                rotate(a = 90, v=[1,0,0])
                    cylinder(h=2, r=12, $fn=smoothness);
            translate([8,-1,-12])
                cube([24,4,12]);
        }
    }
}

module create_mount() {
    translate([2,0,-17])
        rotate( a = -90, v=[0,1,0] ){
            union() {
                translate([0,14,0])
                    cube([17,7,2]);
                translate([12,14,2])
                    cube([5,7,1.5]);
                difference() {
                    translate([3,3,0])
                        minkowski() {
                            cube([3,28,1]);
                            cylinder(h=1, r=3, $fn=smoothness);
                        }
                    translate([4.5,4.5,-0.001]) {
                    create_screw_hole();
                    translate([0,25,0]) {
                        create_screw_hole();
                        }
                    }
                }
            }
        }
}

module create_plate() {
    translate([-30,14,0])
        cube([30,7,2]);
}

module create_join() {
    translate([0,14 ,0])
        difference() {
            rotate(a = -90, v=[1,0,0])
                cylinder(h=7, r=2, $fn=smoothness);
            translate([-2,-1,-2])
                cube([2,9,2]);
        }
}

module create_screw_hole(x, y) {
    union() {
        cylinder(h=5, r=3/2, $fn=smoothness);
        cylinder(h=1.86, r1=6/2, r2=3/2, $fn=smoothness);
    }
}