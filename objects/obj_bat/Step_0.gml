if (state == e_monster_states.idle){
	
	#region IDLE - MAKE THE BAT HOVER
	
	y += (sin(idle_timer) * HOVER_POWER);

	idle_timer += 0.1;
	
	#endregion
	
	#region CHANGE STATE TO ATTACK
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, true);
	
	if (player != noone){
		detection_timer ++;
		
		if (detection_timer >= room_speed){
			
			state = e_monster_states.attack;
			target_x = player.x;
			target_y = player.y;
			
			detection_timer = 0;	
		}
	}
	
	#endregion
}

if (state == e_monster_states.attack){
	
	
	
}