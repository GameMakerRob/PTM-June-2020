event_inherited(); //inherited from obj_all_actors_PARENT

#macro JUMP_SPEED 12
#macro GRAV 1
#macro MAX_GRAV 8

MOVE_SPEED = 2;

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

//used to get player's facing direction
facing = 1;

enum states{
	IDLE,
	WALK,
	ATTACK,
	BLOCK,
}

sprite_array[states.IDLE] = spr_player_idle;
sprite_array[states.WALK] = spr_player_walk;

//sprite_index = spr_player_idle;

attackstat  = 3;
defencestat = 4;
defence     = 0;
guarding    = 0; 
attack      = attackstat;
hp			= 10;
hp_max		= 10;

boomerang_active = false;
boomerang_count  = 0;
activeboomerangs = 0;

has_potion = false;

// Set all keys found to false;
for (var i = 0; i < e_keys.last; i ++){
	keys_found[i] = false;	
}

spawn_x = x;
spawn_y = y;