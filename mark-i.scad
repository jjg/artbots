MOTOR_DIAMETER = 10;
MOTOR_LENGTH=12;
MOTOR_SHAFT_DIAMETER = 1;
LEG_DIAMETER = 3;

//$fn=50;

SHELL = 2;

module body(){
    difference(){
        cylinder(r=(MOTOR_DIAMETER+SHELL)/2,h=MOTOR_LENGTH+SHELL);
    }   
}


module leg(){
    rotate([0,35,0]){
        difference(){
            cylinder(r=(LEG_DIAMETER+SHELL)/2,h=MOTOR_LENGTH+1);
            translate([0,0,-1]){
                #cylinder(r=LEG_DIAMETER/2,h=MOTOR_LENGTH);
            }
        }
    }
}

// ASSEMBLE!
difference(){
    union(){
        body();

        for(i=[1:4]){
            rotate([0,0,i*90]){
                translate([-((MOTOR_DIAMETER)),0,0]){
                    leg();
                }
             }
         }
    }

    translate([0,0,SHELL]){
        // motor
        cylinder(r=MOTOR_DIAMETER/2,h=MOTOR_LENGTH);
    }
}