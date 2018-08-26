//
//  <----------    L    -------->
//          <---   m   --->
//                <g>
//   _____________   _____________
//  |      _      | |      _      |    |
//  |     / \     | |     / \     |    |
//  |     \_/     | |     \_/     |    |  |
//   \            | |            /  |  |  |
//    \           | |           /   |  D  |
//     \          | |          /    |  |  n
//      \         | |         /     d  |  |
//       \       /   \       /      |  |  |
//        \_____|     |_____/       |  |  |
//
//               < G >
//        <-----  l  ------->



L = 34;
l = 18;
D = 17;
d = 13;
G = 6.5; 
g = 4;
m = 15.5;
n = 11.25;
ant_hole_dia = 6.5;
plate_thick = 2.5;

translate([0, 0, plate_thick/2])
    difference() {
        linear_extrude(height = plate_thick, center = true, 
                        convexity = 10, twist = 0)
            polygon(points=[[-l/2, 0],
                            [l/2, 0],
                            [L/2, d],
                            [L/2, D],
                            [-L/2, D],
                            [-L/2, d]]);
        union() {
            translate([0, ant_hole_dia/2, 0])
                cylinder(h = plate_thick+2, r=ant_hole_dia/2, center = true, $fn=100);
            translate([0, ant_hole_dia/4-1, 0])
                cube([ant_hole_dia, ant_hole_dia/2+2, plate_thick+2], center=true);
            translate([0, D/2+1, 0])
                cube([g, D+2, plate_thick+2], center=true);
            translate([-m/2, n, 0])
                cylinder(h = plate_thick+2, r=ant_hole_dia/2, center = true, $fn=100);
            translate([m/2, n, 0])
                cylinder(h = plate_thick+2, r=ant_hole_dia/2, center = true, $fn=100);
        }
    }


led_sup_hole_dia = 3;
top_hole_height = 9.5;
inter_hole = 26;
cable_pocket_thick = 1;
led_supp_thick = 2;
bot_leg_width = 12;
border_reserve = 3;
pocket_reserve = 1.5;

max_supp_thick = led_supp_thick + cable_pocket_thick;    
bot_hole_height = inter_hole - top_hole_height;    
bot_length = bot_hole_height+(led_sup_hole_dia/2)+border_reserve;
difference() {
    difference() {
        union() {    
            translate([-l/2, -max_supp_thick, 0])
                cube(
                [l, 
                max_supp_thick, 
                top_hole_height+(led_sup_hole_dia/2)+border_reserve], 
                center=false);
                translate([-bot_leg_width/2, -max_supp_thick, -bot_length])
                cube(
                [bot_leg_width, 
                max_supp_thick, 
                bot_length], 
                center=false);
        }
        translate([-(l+2)/2, -(max_supp_thick+1), -(bot_hole_height-led_sup_hole_dia/2-pocket_reserve)])
            cube([l+2, cable_pocket_thick+1, inter_hole-led_sup_hole_dia-(2*pocket_reserve)], center=false);
    }
    
    translate([0, -(max_supp_thick)/2, top_hole_height]) {
        rotate([-90, 0, 0]) {
            union() {
                cylinder(h = max_supp_thick+2, d=led_sup_hole_dia, center = true, $fn=100);
                translate([0, inter_hole, 0])
                cylinder(h = max_supp_thick+2, d=led_sup_hole_dia, center = true, $fn=100);
            }
        }
    }
}


brace_width = (l-ant_hole_dia)/2;
brace_side = 6;

translate([ant_hole_dia/2 + brace_width, brace_side, plate_thick])
    rotate([0, 0, 180])
        prism(brace_width, brace_side, brace_side);
translate([-ant_hole_dia/2, brace_side, plate_thick])
    rotate([0, 0, 180])
        prism(brace_width, brace_side, brace_side);
 
module prism(l, w, h){
    polyhedron(
    points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
    faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

