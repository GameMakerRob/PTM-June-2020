/// anim()
// used to control basic animation for the player - mv

//face correct way
if hsp != 0 && vsp == 0 {
	facing = sign(hsp); //Adjust sprite direction depending on the side
	sprite_index = sprite_array[states.WALK]
}

//changes graphics based on moving/not moving
//if hsp == 0 sprite_index = sprite_array[states.IDLE] else sprite_index = sprite_array[states.WALK];

else {
	sprite_index = sprite_array[states.IDLE];
}

if vsp != 0 {
	if vsp < 0 {
		sprite_index = spr_player_jump_up;
		if image_index >= image_number - sprite_get_speed(sprite_index)/room_speed {
			image_speed = 0;
		}
	} else {
		image_speed = 1;
		sprite_index = spr_player_jump_down;
	}
}

//makes sure the character is facing the 
image_xscale = facing;