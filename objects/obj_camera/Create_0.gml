view_width = camera_get_view_width(view_camera[0]);
view_height = camera_get_view_height(view_camera[0]);

if (instance_exists(obj_player) ){
	
	cx = obj_player.x - (view_width / 2);
	cy = obj_player.y - (view_height / 2);
	
}else{
	cx = camera_get_view_x(view_camera[0]);
	cy = camera_get_view_y(view_camera[0]);
}