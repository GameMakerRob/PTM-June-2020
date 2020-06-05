if (state == "INIT"){
	#region GA_HEIGHTS
	
	draw_tilemap(tilemapid,0,0);

	draw_tilemap(tilemapid,0,0);
	heightstoget = totalTiles * GRID_SIZE;
	for (var i = 0; i < heightstoget; i++){
		var check = 0;
		while (check <= GRID_SIZE){
			global.heights[i] = check;
			if (check == GRID_SIZE) break;
			if (surface_getpixel(application_surface,i,check) != c_black){
				break;
			}
			check++;
		}
	}
	
	count = 0;
	for (var tiles = 0; tiles < totalTiles; tiles ++){
		for (var heights = 0; heights < GRID_SIZE; heights ++){
			ga_heights[tiles, heights] = global.heights[count];
			count ++;
		}
	}
	
	state = "READY";
	room_goto_next();
	#endregion	
}