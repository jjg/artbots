MOTOR_DIAMETER = 23.7;
MOTOR_LENGTH=31;
MOTOR_SHAFT_DIAMETER = 2;
MOTOR_SHAFT_LENGTH = 6;
MOTOR_FACE_DIAMETER = 19;
MOTOR_FACE_DEPTH = 3;

BATTERY_DIAMETER = 16.5;
BATTERY_LENGTH = 34.2;
BATTERY_FACE_DIAMETER = 6;
BATTERY_FACE_DEPTH = 1;

LEG_DIAMETER = 3;

WEIGHT_DIAMETER = MOTOR_DIAMETER;
WEIGHT_HEIGHT = 7;

//$fn=50;

SHELL = 2;

module motor(){
    cylinder(r=MOTOR_DIAMETER/2,h=MOTOR_LENGTH-MOTOR_FACE_DEPTH);
    translate([0,0,MOTOR_LENGTH-MOTOR_FACE_DEPTH]){
        cylinder(r=MOTOR_FACE_DIAMETER/2,h=MOTOR_FACE_DEPTH);
        translate([0,0,MOTOR_FACE_DEPTH]){
            cylinder(r=MOTOR_SHAFT_DIAMETER/2,h=MOTOR_SHAFT_LENGTH);
        }
    }
}

module battery(){
    cylinder(r=BATTERY_DIAMETER/2,h=BATTERY_LENGTH);
    translate([0,0,BATTERY_LENGTH]){
        cylinder(r=BATTERY_FACE_DIAMETER/2,h=BATTERY_FACE_DEPTH);
    }
}

module body(){
    difference(){
        cylinder(r=(MOTOR_DIAMETER+SHELL)/2,h=MOTOR_LENGTH+BATTERY_LENGTH);
        
        // make room for the motor
        translate([0,0,MOTOR_LENGTH-MOTOR_FACE_DEPTH]){
            rotate([0,180,0]){
                motor();
            }
        }
        
        // make room for battery
        translate([0,0,MOTOR_LENGTH+SHELL]){
            cylinder(r=BATTERY_DIAMETER/2,h=BATTERY_LENGTH);
        }
        
        // cut holes for the wires (motor)
        translate([-(MOTOR_DIAMETER/2)-SHELL,0,MOTOR_LENGTH-5]){
            rotate([0,90,0]){
                cylinder(r=2,h=MOTOR_DIAMETER+(SHELL*2));
            }
        }
        
        // (battery)
        translate([-MOTOR_DIAMETER/2+SHELL,0,MOTOR_LENGTH+SHELL]){
            rotate([0,90,0]){
                cylinder(r=2,h=MOTOR_DIAMETER);
            }
        }
    }   
}

module leg(){
    rotate([0,35,0]){
        difference(){
            cylinder(r=(LEG_DIAMETER+(SHELL*2))/2,h=MOTOR_LENGTH*1.7);
            translate([0,0,-1]){
                cylinder(r=LEG_DIAMETER/2,h=MOTOR_LENGTH);
            }
        }
    }
}

module weight(){
    difference(){
        cylinder(r=MOTOR_DIAMETER/2,h=5);
        translate([MOTOR_DIAMETER/4,0,-1]){
            cylinder(r=MOTOR_SHAFT_DIAMETER/2,h=7);
        }
    }
}

// ASSEMBLE!
union(){
    translate([0,0,WEIGHT_HEIGHT+SHELL]){
        rotate([0,0,45]){
            body();
        }
    }

    for(i=[1:4]){
        rotate([0,0,i*90]){
            translate([-MOTOR_DIAMETER*1.7,0,0]){
                leg();
            }
         }
     }
}
/*
translate([-WEIGHT_DIAMETER/4,0,3]){
    weight();
}
*/