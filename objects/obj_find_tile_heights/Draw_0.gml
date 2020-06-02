sprite = spr_tiles_test;

if (!surface_exists(surf) ) surf = surface_create(sprite_get_width(sprite), sprite_get_height(sprite));

surface_set_target(surf);
draw_clear_alpha(0, 0);

draw_sprite(sprite, 0, 0, 0);
draw_set_colour(c_white);
surface_reset_target();

draw_surface(surf, 0, 0);

var count = 0;
var vertical_tiles = (sprite_get_height(sprite) / TILE_SIZE);
var horizontal_tiles = (sprite_get_width(sprite) / TILE_SIZE);

for (var yy = 0; yy < vertical_tiles; yy ++){

	for (var xx = 0; xx < horizontal_tiles; xx ++){
	
		for (var x_count = 0; x_count < TILE_SIZE; x_count ++){
			var x_coord = (xx * TILE_SIZE) + x_count;
		
			//Check top collision
			for (var height = 0; height < TILE_SIZE; height ++){
				var y_coord = (yy * TILE_SIZE) + height;
			
				col = surface_getpixel(surf, x_coord, y_coord);
			
				if (col != 0){
					break;
				}
			
			}
			
			global.tile_heights_top [| count] = height;
			
			//Check bottom collision
			for (var height = 15; height >= 0; height --){
				var y_coord = (yy * TILE_SIZE) + height;
				if (yy > 0) show_debug_message("bottom xcoord: " + string(x_coord));
				if (yy > 0) show_debug_message("bottom y_coord: " + string(y_coord));
				col = surface_getpixel(surf, x_coord, y_coord);
			
				if (col != 0){
					break;
				}
			
			}

			global.tile_heights_bottom[| count] = height;
			
			count ++;
		}
	}
	
}

for (var i = 0; i < ds_list_size(global.tile_heights_top ); i ++){
	show_debug_message("Tile: " + string(floor(i / TILE_SIZE)) + " | column: " + string(i mod TILE_SIZE) + " | height: " + string(global.tile_heights_top [| i]) );
}

room_goto_next();

