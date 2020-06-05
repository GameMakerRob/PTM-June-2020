if (instance_exists(obj_player) ){
	
	cx = obj_player.x - (view_width / 2);
	cy = obj_player.y - (view_height / 2);
	
	//Clamp the camera to the room width/height
	cx = clamp(cx, 0, room_width - view_width);
	cy = clamp(cy, 0, room_height - view_height);
	
	camera_set_view_pos(view_camera[0], cx, cy);
}