if (hit_timer > 0) image_alpha = ceil (hit_timer mod 2);
else image_alpha = 1;

if (state == e_monster_states.dead) image_alpha = 0;

draw_self();
/*
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_black);

draw_text(x, y, string(hit_timer) );