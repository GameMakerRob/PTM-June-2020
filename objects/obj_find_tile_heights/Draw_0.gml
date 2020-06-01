if (!surface_exists(surf) ) surf = surface_create(160, 16);

surface_set_target(surf);
draw_clear_alpha(0, 0);

draw_sprite(spr_tiles_test, 0, 0, 0);
draw_set_colour(c_white);
surface_reset_target();

draw_surface(surf, 0, 0);

var tile_size = 16;
var count = 0;
var vertical_tiles = (sprite_get_height(spr_tiles_test) / tile_size);
var horizontal_tiles = (sprite_get_width(spr_tiles_test) / tile_size);

for (var yy = 0; yy < vertical_tiles; yy ++){

	for (var xx = 0; xx < horizontal_tiles; xx ++){
	
		for (var x_count = 0; x_count < tile_size; x_count ++){
			var x_coord = (xx * tile_size) + x_count;
		
			//Check top collision
			for (var height = 0; height < tile_size; height ++){
				var y_coord = (yy * tile_size) + height;
			
				col = surface_getpixel(surf, x_coord, y_coord);
			
				if (col != 0){
					break;
				}
			
			}
			
			tile_heights_top[| count] = height;
			
			//Check bottom collision
			for (var height = 15; height >= 0; height --){
				var y_coord = (yy * tile_size) + height;
				if (yy > 0) show_debug_message("bottom xcoord: " + string(x_coord));
				if (yy > 0) show_debug_message("bottom y_coord: " + string(y_coord));
				col = surface_getpixel(surf, x_coord, y_coord);
			
				if (col != 0){
					break;
				}
			
			}

			tile_heights_bottom[| count] = height;
			
			count ++;
		}
	}
	
}

for (var i = 0; i < ds_list_size(tile_heights_top); i ++){
	show_debug_message("Tile: " + string(floor(i/tile_size)) + " | column: " + string(tile_size mod i) + " | height: " + string(tile_heights_top[| i]) );
}

room_goto_next();

