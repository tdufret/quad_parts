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
reserve = 3;
    
max_supp_thick = led_supp_thick + cable_pocket_thick;    
translate([-l/2, -max_supp_thick, 0])
    cube(
    [l, 
    max_supp_thick, 
    top_hole_height+(led_sup_hole_dia/2)+reserve], 
    center=false);



