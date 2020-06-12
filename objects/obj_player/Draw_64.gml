draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);

draw_text(0, 0, "HP: " + string(hp) + "/" + string(hp_max) );

//draw_text(0, 0, "Press f12 to restart");
/*
draw_text(0, 22, "Boomerangs: " + string(boomerang_count));
draw_text(0, 44, "Potion: " + string(has_potion));

draw_text(0, 88, "Attack: " + string(attackstat));
draw_text(0, 100, "Defence: " + string(defence));
draw_text(0, 112, "key_primary: " + string(key_primary));

if(key_primary)
{
	//Made an object so we can use that for hit_detection
	//draw_rectangle_color(x, y, x+32, y+32, c_red, c_red, c_red, c_red, false);
}