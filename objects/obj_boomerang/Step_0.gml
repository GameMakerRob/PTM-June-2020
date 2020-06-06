if(image_xscale == 1) 
{
	speed -= 0.1;
} else 
{
	speed += 0.1;
}

image_angle += 9;
Dtimer --;

if(Dtimer <= -120)
{
	obj_player.activeboomerangs--;
	instance_destroy();
}