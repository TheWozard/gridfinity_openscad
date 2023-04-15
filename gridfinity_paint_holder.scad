include <gridfinity_modules.scad>
use <gridfinity_cup_modules.scad>

// X dimension in grid units
width = 2; // [ 0.5, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ]
// Y dimension in grid units
depth = 1; // [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 ]
// Z dimension (multiples of 7mm)
height = 3;
// (Zack's design uses magnet diameter of 6.5)
magnet_diameter = 6.2;  // .1

difference() {
    grid_block(width, depth, height, magnet_diameter=magnet_diameter, screw_depth=0);
    color("#FF6D60") paints(width, depth, height);
}

module paints(num_x, num_y, height) {
    for (x = [0:num_x-1]) {
        for (y = [0:num_y-1]) {
            translate([x * gridfinity_pitch, y * gridfinity_pitch,  5]) paint(height);
        }
    }
}

module paint(height) {
    cylinder(height * gridfinity_zpitch, 17, 17);
}
