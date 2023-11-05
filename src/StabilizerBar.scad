stabilizerBarX=280;
stabilizerBar1Y=10;
stabilizerBar1Z=5;
stabilizerBar2Y=5;
stabilizerBar2Z=5;

holeX=5;
holeDiameter=2.5;
holeDeltaZ=2.5;

//uncomment next line to create model
//stabilizerBarWithHole();

module stabilizerBarWithHole(){
    render(convexity = 2)
    difference()
    {
        stabilizerBar();
        holes();
    }
}

module stabilizerBar(){
    overlap=2;
    gap=0.6;
    minkowskiDiameter=0.2;

    color("blue")
    minkowski() 
    {
        union()
        {
            cube([stabilizerBarX-minkowskiDiameter,stabilizerBar1Y-gap-minkowskiDiameter,stabilizerBar1Z-gap-minkowskiDiameter],center=true);
            translate([0,0,stabilizerBar2Z-overlap/2])
            cube([stabilizerBarX-minkowskiDiameter,stabilizerBar2Y-gap-minkowskiDiameter,stabilizerBar2Z-gap-minkowskiDiameter+overlap],center=true);
        }
        sphere(d=minkowskiDiameter, $fn=30);
    }    
}

module stabilizerBarHole(){
    overlap=0.001;
    color("red")
        union()
        {
            cube([stabilizerBarX,stabilizerBar1Y,stabilizerBar1Z],center=true);
            translate([0,0,stabilizerBar2Z-overlap])
            cube([stabilizerBarX,stabilizerBar2Y,stabilizerBar2Z+overlap],center=true);
        }
}

module holes(){
    overlap=0.001;
    translate([-stabilizerBarX/2+holeX/2-overlap,0,holeDeltaZ])
    rotate([0,90,0])
    cylinder(h=holeX, d=holeDiameter, center=true);
    
    translate([stabilizerBarX/2-holeX/2+overlap,0,holeDeltaZ])
    rotate([0,90,0])
    cylinder(h=holeX, d=holeDiameter, center=true);
}
