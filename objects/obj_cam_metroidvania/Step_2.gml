/*
	If the player is too close to one of the edges and the camera can move (it won't be going past the current obj_room_mask edge)
	then the camera should move to keep the player within sight
*/

if (instance_exists(obj_player) ){
	mask = collision_point(obj_player.x, obj_player.y, obj_room_mask, false, false);
	
	if (mask != noone){
		
		#region Get the edges of the current mask
		
		cam_left = mask.x;
		cam_top = mask.y;
		cam_right = cam_left + (sprite_get_width(mask.sprite_index) * mask.image_xscale);
		cam_bottom = cam_top + (sprite_get_height(mask.sprite_index) * mask.image_yscale);
		
		#endregion
		
		#region KEEP THE PLAYER IN SHOT
		
		#region HORIZONTAL
		
		if (obj_player.x - MARGIN_H) < cx && (cx > cam_left){
			cx -= obj_player.MOVE_SPEED;
		}
		
		if (obj_player.x + MARGIN_H > (cx + sprite_get_width(mask.sprite_index)) ){
			cx += obj_player.MOVE_SPEED;	
		}
		
		#endregion
		
		#region VERTICAL
		
		if (obj_player.y - MARGIN_V) < cy{
			cy -= MAX_GRAV;	
		}
		
		if (obj_player.y + MARGIN_V) > (cy + sprite_get_height(mask.sprite_index)){
			cy += MAX_GRAV;	
		}
		
		#endregion
		
		#endregion
		
		#region Clamp the camera
		
		cx = clamp(cx, cam_left, cam_right - sprite_get_width(mask.sprite_index) );
		cy = clamp(cy, cam_top, cam_bottom - sprite_get_height(mask.sprite_index) );
		
		#endregion
		
	}

	
	camera_set_view_pos(view_camera[0], cx, cy);
}

#region OLD CAM CODE
/*
if (state == 0 && instance_exists(obj_player) ){
	
	mask = collision_point(obj_player.x, obj_player.y, obj_room_mask, false, false);
	
	if (mask != noone){
		cam_left = mask.x;
		cam_top = mask.y;
		cam_right = cam_left + (sprite_get_width(mask.sprite_index) * mask.image_xscale);
		cam_bottom = cam_top + (sprite_get_height(mask.sprite_index) * mask.image_yscale);
		
		//cx = cam_left;
		//cy = cam_top;
		
		//camera_set_view_pos(view_camera[0], cx, cy);
		
		mask_prev = mask;
		
		//Set the player's new spawn point (returns to it if dead)
		with obj_player{
			spawn_x = x;
			spawn_y = y;
		}
		
		state = 1;	
	}else show_debug_message("no room mask found - obj_cam_metroidvania step event line 12");
}

if (state == 1){
	
	#region keep the player in view if the mask is larger than the view
	
	if (instance_exists(obj_player) ){
		
		if ( abs(obj_player.x - cx) < MARGIN && cx > cam_left )
			cx -= obj_player.MOVE_SPEED;
			
		if ( abs(obj_player.x - (cx + sprite_get_width(spr_room_mask) ) ) < MARGIN && cx < (cam_right - sprite_get_width(spr_room_mask) ) ){
			cx += obj_player.MOVE_SPEED;
		}
		
		if (obj_player.y < cy) cy -= sprite_get_height(spr_room_mask);
		if (obj_player.y + 32) > cy + sprite_get_height(mask.sprite_index) cy += 16;

		camera_set_view_pos(view_camera[0], cx, cy);
		
	}
	
	#endregion
	
	#region SWITCH TO NEW ROOM MASK IF IT'S DIFFERENT FROM PREVIOUS
	
	mask = collision_point(obj_player.x, obj_player.y, obj_room_mask, false, false);
	
	if (mask != mask_prev && mask != noone){
		cam_left = mask.x;
		cam_top = mask.y;
		cam_right = cam_left + (sprite_get_width(mask.sprite_index) * mask.image_xscale);
		cam_bottom = cam_top + (sprite_get_height(mask.sprite_index) * mask.image_yscale);
		
		show_debug_message(" NEW ROOM MASK ");
		show_debug_message(" cam_left: " + string(cam_left) );
		show_debug_message(" cam_top: " + string(cam_top) );
		show_debug_message(" cam_right: " + string(cam_right) );
		show_debug_message(" cam_bottom: " + string(cam_bottom) );
		cx = cam_left;
		cy = cam_top;
		
		camera_set_view_pos(view_camera[0], cx, cy);
		
		with obj_player{
			spawn_x = x;
			spawn_y = y;
		}
		
		mask_prev = mask;
	}
	
	#endregion
	
}

*/

#endregion