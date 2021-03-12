// Cheap hobby motor
TAIL_HUB_LENGTH = 2.1;
TAIL_HUB_DIAMETER = 8.61;
TAIL_LENGTH = 1.82;
TAIL_DIAMETER = 24.07;
BODY_LENGTH = 21.51;
BODY_DIAMETER = 23.69;
FACE_LENGTH = 3.68;
FACE_DIAMETER = 19.0;
FACE_HUB_LENGTH = 1.53;
FACE_HUB_DIAMETER = 6.05;
FACE_HOLE_DIAMETER = 2.27;
SHAFT_LENGTH = 6.39;
SHAFT_DIAMETER = 2.02;

// tail
cylinder(r=TAIL_HUB_DIAMETER/2, h=TAIL_HUB_LENGTH);
// tail hub
translate([0,0,TAIL_HUB_LENGTH]){
    cylinder(r=TAIL_DIAMETER / 2, h=TAIL_LENGTH);
    // body
    translate([0,0,TAIL_LENGTH]){
        cylinder(r=BODY_DIAMETER/2, h=BODY_LENGTH);
        // face
        translate([0,0,BODY_LENGTH]){
            difference(){
                cylinder(r=FACE_DIAMETER/2, h=FACE_LENGTH);
                // face holes (mounting holes?)
                translate([-5,0,1]){
                    cylinder(r=FACE_HOLE_DIAMETER/2, h=FACE_LENGTH);
                }
                translate([5,0,1]){
                    cylinder(r=FACE_HOLE_DIAMETER/2, h=FACE_LENGTH);
                }
            }
            // shaft
            translate([0,0,FACE_LENGTH]){
                cylinder(r=SHAFT_DIAMETER/2, h=SHAFT_LENGTH);
            }
        }
    }
}