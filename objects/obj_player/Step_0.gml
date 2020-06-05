/*

if (global.HELD_LEFT){
	
	repeat ( abs (move_speed) ){
		var lay_id = layer_get_id("Ground");
		var map_id = layer_tilemap_get_id(lay_id);
		var tile = tilemap_get_at_pixel(map_id, x - 1, y);
		var column = (x - 1) mod TILE_SIZE;
		height = global.tile_heights_top[| (tile * TILE_SIZE) + column];
		
		if (y mod TILE_SIZE) < height x --;
		
		//show_message("(y mod TILE_SIZE): " + string((y mod TILE_SIZE)) + " | height: " + string(height));
	}
}

if (global.HELD_RIGHT){
		repeat ( abs (move_speed) ){
		var lay_id = layer_get_id("Ground");
		var map_id = layer_tilemap_get_id(lay_id);
		var tile = tilemap_get_at_pixel(map_id, x + 1, y);
		var column = (x + 1) mod TILE_SIZE;
		height = global.tile_heights_top[| (tile * TILE_SIZE) + column];
		
		if (y mod TILE_SIZE) < height x ++;
		
		//show_message("(y mod TILE_SIZE): " + string((y mod TILE_SIZE)) + " | height: " + string(height));
	}	
}
*/



hsp = (global.HELD_RIGHT - global.HELD_LEFT) * move_speed;

scr_move_horizontally(hsp);

if (vsp != 0){

	if (vsp < 0) bbox_side = bbox_top; else bbox_side = bbox_bottom;

	repeat ( abs (vsp) ){
		var lay_id = layer_get_id("Ground");
		var map_id = layer_tilemap_get_id(lay_id);
	
		var tile_left = tilemap_get_at_pixel(map_id, bbox_left, bbox_side + abs(vsp));
		var tile_right = tilemap_get_at_pixel(map_id, bbox_right, bbox_side + abs(vsp));
	
		//show_debug_message("tile_left: " + string(tile_left));
		//show_debug_message("tile_right: " + string(tile_right));
		
		var column_left = bbox_left mod TILE_SIZE;
		var column_right = bbox_right mod TILE_SIZE;
		
		//show_debug_message("column_left: " + string(column_left));
		//show_debug_message("column_right: " + string(column_right));
		
		var height_left = global.tile_heights_top[| (tile_left * TILE_SIZE) + column_left];
		var height_right = global.tile_heights_top[| (tile_right * TILE_SIZE) + column_right];
		
		//show_debug_message("height_left: " + string(height_left));
		//show_debug_message("height_right: " + string(height_right));
		
		if height_left > (y mod TILE_SIZE) && height_right > (y mod TILE_SIZE) y += sign(vsp);
		
		//show_debug_message("y mod TILE_SIZE): " + string(y mod TILE_SIZE));
		
		//show_message("(y mod TILE_SIZE): " + string((y mod TILE_SIZE)) + " | height: " + string(height));
	}
	
}
/*
if (global.HELD_UP){
	y -= move_speed;	
}

if (global.HELD_DOWN){
	y += move_speed;	
}
