if (state == 0 && instance_exists(obj_player) ){
	
	mask = collision_point(obj_player.x, obj_player.y, obj_room_mask, false, false);
	
	if (mask != noone){
		cam_left = mask.x;
		cam_top = mask.y;
		cam_right = cam_left + (sprite_get_width(mask.sprite_index) * mask.image_xscale);
		cam_bottom = cam_top + (sprite_get_height(mask.sprite_index) * mask.image_yscale);
		
		cx = cam_left;
		cy = cam_top;
		
		camera_set_view_pos(view_camera[0], cx, cy);
		
		mask_prev = mask;
		
		state = 1;	
	}else show_debug_message("no room mask found - obj_cam_metroidvania step event line 12");
}

if (state == 1){
	
	#region SWITCH TO NEW ROOM MASK IF IT'S DIFFERENT FROM PREVIOUS
	
	mask = collision_point(obj_player.x, obj_player.y, obj_room_mask, false, false);
	
	if (mask != mask_prev && mask != noone){
		cam_left = mask.x;
		cam_top = mask.y;
		cam_right = cam_left + (sprite_get_width(mask.sprite_index) * mask.image_xscale);
		cam_bottom = cam_top + (sprite_get_height(mask.sprite_index) * mask.image_yscale);
		
		cx = cam_left;
		cy = cam_top;
		
		camera_set_view_pos(view_camera[0], cx, cy);
		
		mask_prev = mask;
	}
	
	#endregion
	
	#region keep the player in view if the mask is larger than the view
	
	if (instance_exists(obj_player) ){
		
		if ( abs(obj_player.x - cx) < MARGIN && cx > cam_left )
			cx -= obj_player.MOVE_SPEED;
			
		if ( abs(obj_player.x - (cx + sprite_get_width(spr_room_mask) ) ) < MARGIN && cx < (cam_right - sprite_get_width(spr_room_mask) ) ){
			cx += obj_player.MOVE_SPEED;
		}
		
		if ( abs(obj_player.y - cy) < MARGIN && cy > cam_top )
			cy -= JUMP_SPEED;
			
		if ( abs(obj_player.y - (cy + sprite_get_height(spr_room_mask) ) ) < MARGIN && cy < (cam_bottom - sprite_get_width(spr_room_mask) ) ) {
			cy += JUMP_SPEED;
		}
		
		camera_set_view_pos(view_camera[0], cx, cy);
		
	}
	
	#endregion
	
}