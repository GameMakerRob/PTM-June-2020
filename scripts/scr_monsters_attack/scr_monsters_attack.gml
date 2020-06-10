#region DAMAGE 

var target = collision_circle(x, y, sprite_width / 2, obj_player, false, true);

if (target != noone && target.hit_timer <= 0 && target.defence > -1){
	scr_damage(id, target);
}

#endregion