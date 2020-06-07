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
			target_y = player.y + 10;
			//Work out the distance in pixels between this object and the player
			total_x_dist = abs ( target_x - x) + FLY_PAST_VALUE;
			x_dist = total_x_dist; //x_dist will decrease as the distance is travelled
			
			//How far does the bat need to "dive" in order to reach the players y coordinate - this could be an upwards movement if the player is above the bat
			//dive_dist_per_x = ( (total_dive_dist / total_x_dist) * 2); //How far should the bat travel vertically per step. x2 because I forgot why (tired), but it made sense and worked!
			
			detection_timer = 0;	
		}
	}
	
	#endregion
	
}

if (state == e_monster_states.return_to_start){
	if (abs (y - start_y) > MOVE_SPEED){
		move_towards_point(target_x, start_y, MOVE_SPEED);
	}else {
		state = e_monster_states.idle;
		speed = 0;
	}
}

if (state == e_monster_states.attack){
	
	#region ATTACK
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, true);
	
	if (x_dist > MOVE_SPEED){
		move_towards_point(player.x, target_y, MOVE_SPEED);
		x_dist -= MOVE_SPEED;	

	}
	
	if (player == noone) state = e_monster_states.return_to_start;	
	
	#endregion
	/*
	#region CHANGE STATE TO ATTACK
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, true);
	
	if (player != noone){
		detection_timer ++;
		
		if (detection_timer >= room_speed){
			
			state = e_monster_states.attack;
			target_x = player.x;
			
			//Work out the distance in pixels between this object and the player
			total_x_dist = abs ( target_x - x) + FLY_PAST_VALUE;
			x_dist = total_x_dist; //x_dist will decrease as the distance is travelled
			
			//How far does the bat need to "dive" in order to reach the players y coordinate - this could be an upwards movement if the player is above the bat
			total_dive_dist = player.y - y;
			dive_dist_per_x = ( (total_dive_dist / total_x_dist) * 2); //How far should the bat travel vertically per step. x2 because I forgot why (tired), but it made sense and worked!
			
			detection_timer = 0;	
		}
	}
	
	#endregion
	
}

if (state == e_monster_states.attack){
	
	#region ATTACK
	
	if (x_dist > 2){
		x += ( sign(target_x - x) * MOVE_SPEED );
		x_dist -= MOVE_SPEED;
		if ( (x_dist / total_x_dist) >= 0.5 ) y += dive_dist_per_x;
		else y -= dive_dist_per_x;

	}else state = e_monster_states.idle;	
	
	#endregion
	*/
}