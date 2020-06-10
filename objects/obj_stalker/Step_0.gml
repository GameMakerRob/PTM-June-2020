//Redice hit_timer
event_inherited();

if (state == e_monster_states.idle){
	
	#region IDLE
	
	if (abs (x - target_x) < MOVE_SPEED){
		
		//Wait for a bit before moving
		timer ++;
		
		if (timer >= (room_speed * 2) ){
		
			//Get a new target_x;
			target_x = x + irandom_range(-50, 50);
		
			hsp = ( sign(target_x - x) * floor(MOVE_SPEED / 2) );
			
			timer = 0;
			
		}else hsp = 0;
	}
	
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, false);
	
	if (player != noone){
		//timer ++;
		
		//if (timer >= room_speed){
			state = e_monster_states.attack;
			timer = 0;
			target_x = player.x;
		//}
	}
	
	#endregion
	
}

if (state == e_monster_states.attack){	
	
	#region ATTACK
	
	timer ++;
	
	if (timer >= room_speed){
		var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, false);
		
		if (player != noone){
			//Follow player
			target_x = player.x;
			hsp = ( sign(target_x - x) * MOVE_SPEED );
		}else{
			state = e_monster_states.idle;
			hsp = 0;
			target_x = x;
		}
		
		timer = 0;
		
		#region DAMAGE 

		scr_monsters_attack();
	
		#endregion
	}
	
	/*
	var player = collision_circle(x, y, DETECTION_RADIUS, obj_player, false, false);
	
	if (player != noone){
		
		//Follow player
		target_x = player.x;
		hsp = ( sign(target_x - x) * MOVE_SPEED );
	}else{
		
		//Change state back to idle if player is outside detection range for a second
		timer ++;
		
		if (timer >= room_speed){
			state = e_monster_states.idle;
			timer = 0;
		}
	}
	*/
	#endregion
	
	/*
	if (abs (x - target_x) < MOVE_SPEED){
		//Get a new target_x;
		target_x = player.x;
		
		hsp = ( sign(target_x - x) * MOVE_SPEED );
	}
	*/
}

#region HORIZONTAL MOVEMENT

//hsp = (key_right - key_left) * MOVE_SPEED;

//executes animation script - mv
//anim();

if hsp <= 0 bbox_side = bbox_left else bbox_side = bbox_right;

repeat abs(hsp){
	bottom_side = tilemap_get_at_pixel(tilemap, bbox_side + sign(hsp), bbox_bottom);
	top_side = tilemap_get_at_pixel(tilemap, bbox_side + sign(hsp), bbox_top);
	
	if (bottom_side != 1) && (top_side != 1){
		//1-ways
		if (ga_tiles[bottom_side, 3] != 0) && (ga_tiles[bottom_side, 3] != sign(hsp) ) || (ga_tiles[top_side, 3] != 0) && (ga_tiles[top_side, 3] != sign(hsp) ){
			hsp = 0;
			break;
		}else{
			x += sign(hsp);
		}
	}else{
		hsp = 0;
		break;
	}
}

left = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom);
right = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom);
middle = tilemap_get_at_pixel(tilemap, x, bbox_bottom);

if (ga_tiles[left, 1] == true) || (ga_tiles[right, 1] == true) || (ga_tiles[middle, 1] == true){
	isOnSlope = true;	
}else{
	isOnSlope = false;	
}
	
if (isOnSlope) && (vsp >= 0){
	leftHeight		= GRID_SIZE - ga_heights[left, bbox_left mod GRID_SIZE];
	rightHeight		= GRID_SIZE - ga_heights[right, bbox_right mod GRID_SIZE];
	middleHeight	= GRID_SIZE - ga_heights[middle, x mod GRID_SIZE];
	plHeight		= GRID_SIZE - bbox_bottom mod GRID_SIZE;
	
	tileHeight = max(leftHeight, rightHeight, middleHeight);
	
	diff = tileHeight - plHeight;
	y -= (diff + 1);
}

#endregion

#region VERTICAL MOVEMENT

if vsp + GRAV <= GRID_SIZE vsp += GRAV;

//FALLING
if (vsp > 0) && (!isOnSlope){
	repeat vsp{
		bottom_left = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1);
		bottom_middle = tilemap_get_at_pixel(tilemap, x, bbox_bottom + 1);
		bottom_right = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1);
		
		//There's a tile below us - match height and stop falling
		if (bottom_left > 0) || (bottom_middle > 0) || (bottom_right > 0){
			//Check heights and fall by 1 if we're too high
			bottom_left_height = GRID_SIZE - ga_heights[bottom_left, bbox_left mod GRID_SIZE];
			bottom_middle_height = GRID_SIZE - ga_heights[bottom_middle, x mod GRID_SIZE];
			bottom_right_height = GRID_SIZE - ga_heights[bottom_right, bbox_right mod GRID_SIZE];
			
			tileHeight = max(bottom_left_height, bottom_middle_height, bottom_right_height);
			plHeightVsp = GRID_SIZE - bbox_bottom mod GRID_SIZE;
			
			diffvsp = GRID_SIZE - abs((plHeightVsp - tileHeight));
			
			
			if (diffvsp > 1){
				y ++;
				/*bugfix
				show_debug_message("Falling");
				sprite_index = spr_player_col;
				*/
			}else{
				//Stop falling if we're at the correct height
				/*bugfix
				show_debug_message("Landing");
				sprite_index = spr_player;
				*/
				vsp = 0;
				break;
			}
		}else{
			//No tile below us
			y ++;	
		}
	}
}

//Bandaid
if (isOnSlope) && (vsp >= 0){
	vsp = 0;	
}

/*
if (key_jump) && (vsp == 0){
	if 	(tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom + 1) > 0) || (tilemap_get_at_pixel(tilemap, x, bbox_bottom + 1) > 0) || (tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom + 1) > 0){
		vsp = -JUMP_SPEED;
	}
}
*/
//JUMPING
if (vsp < 0){
	repeat abs(vsp){
		if (tilemap_get_at_pixel(tilemap, bbox_left, bbox_top - 1) != 1) && (tilemap_get_at_pixel(tilemap, bbox_right, bbox_top - 1) != 1){
			y --;
		}else{
			vsp = 0;
			break;
		}	
	}
}

#endregion