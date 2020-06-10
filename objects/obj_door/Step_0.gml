var w = sprite_width;
var h = sprite_height;

player = collision_rectangle(x - 4, y , x + w + 4, y + h, obj_player, false, false);

if (player != noone){
	if (player.keys_found[key] = true){
		instance_destroy();
		start_y = floor(y / 16);
		end_y = start_y + 4;
		start_x = floor(x / 16);
		end_x = start_x + 2;
		
		var lay_id = layer_get_id("Tiles_Collision");
		tilemap = layer_tilemap_get_id(lay_id);
		
		for (var yy = start_y; yy < end_y; yy ++){
			for (var xx = start_x; xx < end_x; xx ++){
				//Set tiles to passable
				tilemap_set(tilemap, 0, xx, yy);
			}
		}
	}
}