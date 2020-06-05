/// anim()
// used to control basic animation for the player - mv

//face correct way
if hsp != 0{
	facing = sign(hsp); //Adjust sprite direction depending on the side
	sprite_index = sprite_array[states.WALK]
}

//changes graphics based on moving/not moving
//if hsp == 0 sprite_index = sprite_array[states.IDLE] else sprite_index = sprite_array[states.WALK];

else{
	sprite_index = sprite_array[states.IDLE];
}

//makes sure the character is facing the 
image_xscale = facing;