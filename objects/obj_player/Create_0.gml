#macro JUMP_SPEED 36
#macro MOVE_SPEED 4
#macro GRAV 4

hsp = 0;
vsp = 0;

var lay_id = layer_get_id("Tiles_Collision");
tilemap = layer_tilemap_get_id(lay_id);

isOnSlope = false;

bottom_left = 0;
bottom_right = 0;
bottom_middle = 0;
bottom_left_height = 64;
bottom_right_height = 64;
bottom_middle_height = 64;

plHeight = ((bbox_bottom mod GRID_SIZE) + 1);