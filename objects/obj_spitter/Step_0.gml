if (state == e_monster_states.idle){
	
	#region IDLE
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, false);
	
	if (player != noone){
		state = e_monster_states.attack;	
	}
	
	#endregion
}

if (state == e_monster_states.attack){
	
	#region ATTACK
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, false);
	
	if (player != noone){
		if (attack_timer < (time_till_attack * room_speed) ) attack_timer ++;
		else{
			#region SHOOT
			
			var projectile = instance_create_layer(x, y, layer, obj_projectile);
			projectile.target = player;
			projectile.spd = 6;
			projectile.image_index = e_projectiles.spitter;
			
			attack_timer = 0;
			time_till_attack = irandom_range(1, 3);
			
			#endregion
		}
	}
	
	#endregion
	
}	