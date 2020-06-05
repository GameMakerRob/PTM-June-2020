draw_self();

draw_set_colour(c_red);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

/* TESTING AND BUFIXING
draw_set_font(fnt_test_lrg);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_colour(c_white);

draw_text(0, 0, "vsp: " + string(vsp));
draw_text(0, 64, "bottom_left: " + string(bottom_left));
draw_text(0, 96, "bottom_right: " + string(bottom_right));
draw_text(0, 128, "bottom_middle: " + string(bottom_middle));

if (plHeight + 1 == bottom_left_height) draw_set_colour(c_green) else draw_set_colour(c_red);
draw_text(0, 160, "BL Height: " + string(bottom_left_height));
if (plHeight + 1 == bottom_right_height) draw_set_colour(c_green) else draw_set_colour(c_red);
draw_text(0, 192, "BR Height: " + string(bottom_right_height));
if (plHeight + 1 == bottom_middle_height) draw_set_colour(c_green) else draw_set_colour(c_red);
draw_text(0, 224, "BM Height: " + string(bottom_middle_height));
draw_set_colour(c_blue);
draw_text(0, 256, "plHeight: " + string(plHeight));
draw_text(0, 288, "isOnSlope: " + string(isOnSlope));
/*
draw_text(0, 32, "Player Height: " + string(bbox_bottom mod GRID_SIZE));
draw_text(0, 64, "Bottom_left: " + string(bottom_left));
draw_text(0, 96, "Bottom_right: " + string(bottom_right));
draw_text(0, 128, "BL Height: " + string(bottom_left_height));
draw_text(0, 160, "BR Height: " + string(bottom_right_height));
if (bottom_left >= 0) draw_text(0, 192, "Real BL height: " + string(GRID_SIZE - ga_heights[bottom_left, bbox_left mod GRID_SIZE]));
if (bottom_right >= 0) draw_text(0, 224, "Real BR height: " + string(GRID_SIZE - ga_heights[bottom_right, bbox_right mod GRID_SIZE]));
/*
draw_text(0, 0, "bbox_bottom mod GRID_SIZE: " + string(bbox_bottom mod GRID_SIZE));
if (bottom_left > -1) draw_text(0, 36, "bl: " + string(GRID_SIZE - (ga_heights[bottom_left, bbox_left mod GRID_SIZE])));
if (bottom_right > -1) draw_text(0, 72, "br: " + string(GRID_SIZE - (ga_heights[bottom_right, bbox_right mod GRID_SIZE])));
draw_text(0, 108, "vsp: " + string(vsp));

/*
draw_text(0, 0, "vsp: " + string(vsp));
draw_text(0, 36, "p1/p2/p3: " + string(p1) + "/" + string(p2) + "/" + string(p3));
draw_text(0, 72, "heights: " + string(p1Height) + "/" + string(p2Height) + "/" + string(p3Height));
draw_text(0, 108, "bottom Mod Gr: " + string((bbox_bottom mod GRID_SIZE) + 1));
draw_text(0, 140, "isStuck: " + string(isStuck));
