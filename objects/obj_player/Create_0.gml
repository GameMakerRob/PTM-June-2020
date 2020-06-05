#macro JUMP_SPEED 12
#macro MOVE_SPEED 2
#macro GRAV 1

hsp = 0;
vsp = 0;

var lay_id = layer_get_id("Tiles_Collision");
tilemap = layer_tilemap_get_id(lay_id);

isOnSlope = false;

bottom_left = 0;
bottom_right = 0;
bottom_middle = 0;
bottom_left_height = GRID_SIZE;
bottom_right_height = GRID_SIZE;
bottom_middle_height = GRID_SIZE;

plHeight = ((bbox_bottom mod GRID_SIZE) + 1);