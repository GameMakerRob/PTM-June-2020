draw_set_halign(fa_left);
draw_set_valign(fa_top);

/*
var lay_id = layer_get_id("Ground");
var map_id = layer_tilemap_get_id(lay_id);
var tile = tilemap_get_at_pixel(map_id, mouse_x, mouse_y);
var column = mouse_x mod TILE_SIZE;
height = global.tile_heights_top[| (tile * TILE_SIZE) + column];
*/

if (hsp != 0){
	
	if (hsp < 0) var bbox_side = bbox_left; else var bbox_side = bbox_right;

	var lay_id = layer_get_id("Ground");
	var map_id = layer_tilemap_get_id(lay_id);
	
	var tile_top = tilemap_get_at_pixel(map_id, bbox_side - 1, bbox_top);
	var tile_bottom = tilemap_get_at_pixel(map_id, bbox_side - 1, bbox_bottom);
	
	var column = (bbox_side + sign(hsp) ) mod TILE_SIZE;
	var height_top = global.tile_heights_top[| (tile_top * TILE_SIZE) + column];
	var height_bottom = global.tile_heights_top[| (tile_bottom * TILE_SIZE) + column];
		
	draw_text(0, 0, "mouse_x mod TILE_SIZE: " + string(mouse_x mod TILE_SIZE) );
	draw_text(0, 20, "mouse_y mod TILE_SIZE: " + string(mouse_y mod TILE_SIZE) );
	draw_text(0, 40, "y mod TILE_SIZE: " + string(y mod TILE_SIZE) );
	draw_text(0, 60, "height_top: " + string(height_top));
	draw_text(0, 80, "height_bottom: " + string(height_bottom));
	draw_text(0, 100, "hsp: " + string(hsp) );

}