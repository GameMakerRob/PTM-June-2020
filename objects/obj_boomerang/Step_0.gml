if(image_xscale == 1) 
{
	speed -= 0.1;
} else 
{
	speed += 0.1;
}

image_angle += 20;
Dtimer --;

if(Dtimer <= -120)
{
	obj_player.activeboomerangs--;
	instance_destroy();
}

#region DAMAGE 

var target = collision_circle(x, y, sprite_width / 2, obj_all_actors_PARENT, false, true);

if (target != noone && target.hit_timer <= 0 && target.defence > -1){
	scr_damage(id, target);
}

#endregion