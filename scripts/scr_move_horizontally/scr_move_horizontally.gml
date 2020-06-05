/// @function scr_move_horizontally()									
/// @description Move horizontally!
/// @param {real} hsp

var hsp = argument0;

if (hsp != 0){

	if (hsp < 0) bbox_side = bbox_left; else bbox_side = bbox_right;

	repeat ( abs (hsp) ){
		var lay_id = layer_get_id("Ground");
		var map_id = layer_tilemap_get_id(lay_id);
	
		var tile_top = tilemap_get_at_pixel(map_id, bbox_side + sign(hsp), bbox_top);
		var tile_bottom = tilemap_get_at_pixel(map_id, bbox_side + sign(hsp), bbox_bottom);
	
		var column = (bbox_side + sign(hsp) ) mod TILE_SIZE;
		var height_top = global.tile_heights_top[| (tile_top * TILE_SIZE) + column];
		var height_bottom = global.tile_heights_top[| (tile_bottom * TILE_SIZE) + column];
		
		//if (y mod TILE_SIZE) > height_top && (y mod TILE_SIZE > height_bottom) x += sign(hsp);
		if height_top > (y mod TILE_SIZE) && height_bottom > (y mod TILE_SIZE) x += sign(hsp);
		
		//show_message("(y mod TILE_SIZE): " + string((y mod TILE_SIZE)) + " | height: " + string(height));
	}
	
}