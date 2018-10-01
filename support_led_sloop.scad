//
//      <--------------->
//     
//   ________________________


entre_axe_plate = 21;
plate_hole_rad = 1.5;
side = 3;
thick = 2;

entre_axe_led = 30.5;
led_hole_rad = 1.5;
led_side = 2;
led_side_top = 1;
led_height = 10;

long_side = entre_axe_plate+2*(plate_hole_rad + side);
short_side = 2*(plate_hole_rad+side);
translate([0, 0, thick/2])
    difference() {
        cube([long_side, short_side, thick], center=true);
        union() {
            translate([entre_axe_plate/2, 0, 0])
                cylinder(h = thick+2, r=plate_hole_rad, center = true, $fn=100);
            translate([-entre_axe_plate/2, 0, 0])
                cylinder(h = thick+2, r=plate_hole_rad, center = true, $fn=100);
        }
    }

led_long_side = entre_axe_led + 2 * (led_hole_rad + led_side);
led_short_side = led_height + led_side_top;
translate([0, (thick+short_side)/2, led_short_side/2])
    rotate([90, 0, 0]) {
        difference() {
            cube([led_long_side, led_short_side, thick], center=true);
            union() {
                translate([entre_axe_led/2, (led_short_side/2)-led_hole_rad-led_side_top, 0])
                    cylinder(h = thick+2, r=led_hole_rad, center = true, $fn=100);
                translate([-entre_axe_led/2, (led_height/2)-led_hole_rad, 0])
                    cylinder(h = thick+2, r=led_hole_rad, center = true, $fn=100);
            }
        }
    }
     
