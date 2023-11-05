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


$vpt=[0,0,0];
$vpr = [$t * 360*2,0,$t * 360];
    
for(i=[1:1:21]){
    posX=-140+(markerY+1)*(22-i);
    
        translate([posX,barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));

        translate([posX,-barsDeltaY,frameDeltaZ])
        rotate([0,0,90])
        tileWithText(str(i));
}
