$fa = 1;
$fs = 0.4;

suppLargAv=103;
suppLargAr=160;
supplong=230;

suppEntreAxe1=70;
suppEntreAxe2=102;
suppEmpat=153;
suppOffsetX=40;
suppOffsetY=30;

wcEntreAxe1=70;
wcEntreAxe2=136.5;
wcEmpat=160;


module masque_vis(empat=160, entreAxe1=70, entreAxe2=136.5 , diam=7.5, epaisseur=15) { 
translate([0, entreAxe1/2, 0])
    cylinder(h=epaisseur, r=diam/2);
translate([0, -entreAxe1/2, 0])
    cylinder(h=epaisseur, r=diam/2);
translate([-empat, entreAxe2/2, 0])
    cylinder(h=epaisseur, r=diam/2);
translate([-empat, -entreAxe2/2, 0])
    cylinder(h=epaisseur, r=diam/2);
}



polygon(points = [ [0, 0], [0, suppLargAv], [-supplong, suppLargAr], [-supplong, 0] ], paths = [[0, 1, 2, 3]], convexity = 1);

translate([-suppOffsetX, suppOffsetY + suppEntreAxe1/2, 0])
    union() {
        masque_vis(empat=suppEmpat, entreAxe1=suppEntreAxe1, 
                    entreAxe2=suppEntreAxe2, diam=7.5, epaisseur=40);
        translate([-20, -0, 0])
            masque_vis(empat=wcEmpat, entreAxe1=wcEntreAxe1, 
                        entreAxe2=wcEntreAxe2 , diam=7.5, epaisseur=20);
    }


