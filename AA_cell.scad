// AA cell
module AA_cell(){
    TERMINAL_LENGTH = 1;
    TERMINAL_DIAMETER = 5.5;
    BODY_LENGTH = 49;
    BODY_DIAMETER = 14.5;

    cylinder(r=BODY_DIAMETER/2, h=BODY_LENGTH);
    translate([0,0,BODY_LENGTH]){
        cylinder(r=TERMINAL_DIAMETER/2, h=TERMINAL_LENGTH);
    }
}