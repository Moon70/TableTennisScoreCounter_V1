include <CounterBar.scad>
include <StabilizerBar.scad>

frameX=10;
frameY=60;
frameZ=30;
frameDeltaZ=10;

frame2X=10;
frame2Y=60;
frame2Z=5;
frame2DeltaZ=-9;

barsDeltaY=15;
barHoleDelta=0.4;

holeDiameter=3.2;

minkowskiRadius=1.5;
$fn=50;

//uncomment next line to create model
//bodyWithHoles();

module bodyWithHoles(){
    render(convexity = 2)
    difference()
    {
        minkowski() {
            body();
            sphere(r=minkowskiRadius, $fn=30);
        }    

        barHoles();
    }
}

module body(){
    cube([frameX,frameY,frameZ],center=true);
    translate([-frame2X/2+frameX/2-5,0,-frameZ/2+frame2Z/2])
    cube([frame2X,frame2Y,frame2Z],center=true);
    
    translate([-12,0,-frameZ/2+frame2Z/2])
    cylinder(h=frame2Z, d=frame2Y, center=true);
}

module barHoles(){
    translate([counterBarX/2,barsDeltaY,frameDeltaZ])
    counterBarHole();
    translate([counterBarX/2,-barsDeltaY,frameDeltaZ])
    counterBarHole();
    
    color("green")
    translate([0,barsDeltaY,frameDeltaZ])
    rotate([0,90,0])
    cylinder(h=50, d=holeDiameter, center=true);
    color("green")
    translate([0,-barsDeltaY,frameDeltaZ])
    rotate([0,90,0])
    cylinder(h=50, d=holeDiameter, center=true);


    translate([stabilizerBarX/2,barsDeltaY,frame2DeltaZ])
    stabilizerBarHole();
    translate([stabilizerBarX/2,-barsDeltaY,frame2DeltaZ])
    stabilizerBarHole();

    
    color("blue")
    translate([0,barsDeltaY,frame2DeltaZ+2.5])
    rotate([0,90,0])
    cylinder(h=50, d=holeDiameter, center=true);
    color("blue")
    translate([0,-barsDeltaY,frame2DeltaZ+2.5])
    rotate([0,90,0])
    cylinder(h=50, d=holeDiameter, center=true);    
}

