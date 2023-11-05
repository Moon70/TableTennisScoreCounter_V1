markerX=20;
markerY=10;
markerZ=10;

holeDelta=0.4;
holeX=10+holeDelta;
holeY=50;
holeZ=5+holeDelta;

textOffsetX=3.2;
textOffsetY=1;
textZ=1;

FontSize=8;

notchX=10;
notchY=6;
notchZ=30;
notchSizeTBX=0.5;
notchSizeTBY=2;
notchSizeLR=1.5;

//uncomment next line to create model
//tileWithText("21");


module tileWithText(Number="88"){
    minkowski() {
        tile();
        sphere(r=0.4, $fn=30);
    }    
    color("blue")
    translate([0,0,markerZ/2-0.01])
    linear_extrude(height = textZ) {
        text(Number, font = "Comic Sans MS:style=", size = FontSize, halign="center",valign="center",$fn=150);
    }
}

module tile(){
    difference()
    {
        cube([markerX,markerY,markerZ],center=true);

        union()
        {
            color("red")
            cube([holeX,holeY,holeZ],center=true);

            color("red")
            translate([markerX/2+notchX/2-notchSizeLR,markerY/2+notchY/2-notchSizeTBY,0])
            cube([notchX,notchY,notchZ],center=true);

            color("red")
            translate([markerX/2+notchX/2-notchSizeLR,-markerY/2-notchY/2+notchSizeTBY,0])
            cube([notchX,notchY,notchZ],center=true);


            color("red")
            translate([-markerX/2-notchX/2+notchSizeLR,markerY/2+notchY/2-notchSizeTBY,0])
            cube([notchX,notchY,notchZ],center=true);

            color("red")
            translate([-markerX/2-notchX/2+notchSizeLR,-markerY/2-notchY/2+notchSizeTBY,0])
            cube([notchX,notchY,notchZ],center=true);


            color("red")
            translate([0,-markerY/2-notchY/2+notchSizeTBX,0])
            cube([notchX,notchY,notchZ],center=true);

            color("red")
            translate([0,markerY/2+notchY/2-notchSizeTBX,0])
            cube([notchX,notchY,notchZ],center=true);
        }
    }
}