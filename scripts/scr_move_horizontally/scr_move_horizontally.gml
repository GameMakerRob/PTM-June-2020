/// @function scr_move_horizontally()									
/// @description Move horizontally!

if (global.HELD_LEFT) bbox_side = bbox_left; else bbox_side = bbox_right;

repeat ( abs (move_speed) ){
	var lay_id = layer_get_id("Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	
	var tile_top = tilemap_get_at_pixel(map_id, bbox_side - 1, bbox_top);
	var tile_bottom = tilemap_get_at_pixel(map_id, bbox_side - 1, bbox_bottom);
	
	var column = (x - 1) mod TILE_SIZE;
	height = global.tile_heights_top[| (tile * TILE_SIZE) + column];
		
	if (y mod TILE_SIZE) < height x --;
		
	//show_message("(y mod TILE_SIZE): " + string((y mod TILE_SIZE)) + " | height: " + string(height));
}