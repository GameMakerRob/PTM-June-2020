draw_self();

#region	TESTING HEIGHTS [commented out]
/*
var lay_id = layer_get_id("Ground");
var map_id = layer_tilemap_get_id(lay_id);
var tile = tilemap_get_at_pixel(map_id, mouse_x, mouse_y);
var column = (mouse_x) mod TILE_SIZE;
var height = global.tile_heights_top[| (tile * TILE_SIZE) + column];

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

draw_text(mouse_x, mouse_y, string(height) );
*/
#endregion