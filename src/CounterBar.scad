counterBarX=280;
counterBarY=10;
counterBarZ=5;

holeX=10;
holeDiameter=2.5;

//uncomment next line to create model
//counterBarWithHole();

module counterBarWithHole(){
    difference()
    {
        counterBar();
        holes();
    }
}

module counterBar(){
    gap=0.6;
    minkowskiRadius=0.2;
    
    color("blue")
    minkowski() {
        cube([counterBarX-minkowskiRadius*2,counterBarY-gap-minkowskiRadius*2,counterBarZ-gap-minkowskiRadius*2],center=true);
        sphere(r=minkowskiRadius, $fn=30);
    }    
}

module counterBarHole(){
    color("red")
    cube([counterBarX,counterBarY,counterBarZ],center=true);
}

module holes(){
    overlap=0.001;
    translate([-counterBarX/2+holeX/2-overlap,0,0])
    rotate([0,90,0])
    cylinder(h=holeX, d=holeDiameter, center=true);
    
    translate([counterBarX/2-holeX/2+overlap,0,0])
    rotate([0,90,0])
    cylinder(h=holeX, d=holeDiameter, center=true);

}
