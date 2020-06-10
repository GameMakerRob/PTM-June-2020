event_inherited();

show_debug_message("obj_attack step running");

var h = sprite_width / 2;

var target = collision_rectangle(x - h, y - h, x + h, y + h, obj_all_actors_PARENT, false, true)
		
if (target != noone && target != owner && target.hit_timer <= 0 && target.defence > -1){
	scr_damage(owner, target);
	show_debug_message("target: " + string(target));
}

instance_destroy();