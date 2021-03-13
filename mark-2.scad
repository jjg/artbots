include <hobby_motor.scad>
include <AA_cell.scad>

difference(){
    
    translate([0,0,-31]){
        cylinder(r=30, h=5);
        
        translate([0,0,40]){
            cylinder(r=30, h=15);
        }
    }
    
    translate([0,0,-30]){
        translate([-25,-2.5,0]){
            cube([50,5,5]);
        }
    }

    #hobby_motor();

    translate([20,0,20]){
        rotate([180,0,0]){
            #AA_cell();
        }
    }
    translate([-20,0,-30]){
        #AA_cell();
    }
}