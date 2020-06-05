/// anim()
// used to control basic animation for the player - mv

//face correct way
if hsp != 0 facing = sign(hsp); //Adjust sprite direction depending on the side

//changes graphics based on moving/not moving
if hsp == 0 sprite_index = sprite_array[states.IDLE] else sprite_index = sprite_array[states.WALK];

//makes sure the character is facing the 
image_xscale = facing;