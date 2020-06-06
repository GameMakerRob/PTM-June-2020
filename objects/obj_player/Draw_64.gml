draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(0, 0, "Press f12 to restart");
draw_text(0, 22, "Boomerangs: " + string(boomerang_count));
draw_text(0, 44, "Potion: " + string(has_potion));

draw_text(0, 88, "Attack: " + string(attackstat));
draw_text(0, 100, "Defence: " + string(defence));

if(key_primary)
{
	draw_rectangle_color(x, y, x+32, y+32, c_red, c_red, c_red, c_red, false);
}