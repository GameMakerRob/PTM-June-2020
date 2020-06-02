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

if (global.HELD_UP){
	y -= move_speed;	
}

if (global.HELD_DOWN){
	y += move_speed;	
}
