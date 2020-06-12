draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0, 0, "cx: " + string(cx) );
draw_text(0, 20, "cy: " + string(cy) );
draw_text(0, 40, "px: " + string(obj_player.x) );
draw_text(0, 60, "py: " + string(obj_player.y) );