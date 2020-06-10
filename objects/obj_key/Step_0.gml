var h = sprite_width/ 2;
player = collision_rectangle(x - h, y - h, x + h, y + h, obj_player, false, false);

if (player != noone){
	player.keys_found[key] = true;
	instance_destroy();
}