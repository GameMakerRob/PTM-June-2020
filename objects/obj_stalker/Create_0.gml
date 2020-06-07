DETECTION_RADIUS = 200;
MOVE_SPEED = 2;

hsp = 0;
vsp = 0;

state = e_monster_states.idle;

target_x = x;
timer = 0;

var lay_id = layer_get_id("Tiles_Collision");
tilemap = layer_tilemap_get_id(lay_id);