include <Base.scad>
include <StabilizerBar.scad>
include <CounterBar.scad>
include <Tile.scad>


translate([-140,0,0])
bodyWithHoles();

translate([140,0,0])
rotate([0,0,180])
bodyWithHoles();

translate([0,barsDeltaY,frame2DeltaZ])
    render(convexity = 2)
stabilizerBarWithHole();

translate([0,-barsDeltaY,frame2DeltaZ])
    render(convexity = 2)
stabilizerBarWithHole();


translate([0,barsDeltaY,frameDeltaZ])
counterBarWithHole();

translate([0,-barsDeltaY,frameDeltaZ])
counterBarWithHole();


for(i=[1:1:21]){
    posX=-140+(markerY+1)*(22-i);
    
    if((i==1)&&($t>0.1)&&($t<=0.2))
        translate([posX+370*($t-0.1),barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==1)&&($t>0.2))
        translate([posX+37,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==2)&&($t>0.4)&&($t<=0.5))
        translate([posX+370*($t-0.4),barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==2)&&($t>0.5))
        translate([posX+37,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==3)&&($t>0.5)&&($t<=0.6))
        translate([posX+370*($t-0.5),barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==3)&&($t>0.6))
        translate([posX+37,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==4)&&($t>0.6)&&($t<=0.7))
        translate([posX+370*($t-0.6),barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==4)&&($t>0.7))
        translate([posX+37,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else
        translate([posX,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));


    if((i==1)&&($t>0.2)&&($t<=0.3))
        translate([posX+370*($t-0.2),-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==1)&&($t>0.3))
        translate([posX+37,-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==2)&&($t>0.3)&&($t<=0.4))
        translate([posX+370*($t-0.3),-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else if((i==2)&&($t>0.4))
        translate([posX+37,-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
    else
        translate([posX,-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));



}
