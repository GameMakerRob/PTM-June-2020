#macro JUMP_SPEED 48
#macro MOVE_SPEED 6
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

//used to get player's facing direction
facing = 0;

enum states{
	IDLE,
	WALK
}

sprite_array[states.IDLE] = spr_player_idle;
sprite_array[states.WALK] = spr_player_walk;

sprite_index = spr_player_idle;