globalvar ga_grid, ga_tiles, ga_heights, GRID_SIZE;

/*
	Solid - Can stand on, can't jump through
	Slope - Can stand on, can jump through
	Platform (Horizontal) - Can stand on, can jump through
	Wall (Vertical) - Can walk through 1 way
*/

/*
	--------
	ga_tiles
	--------
	Save data for tiles
	Need to know
	 - Solid
	 - Slope
	 - Height of all columns in tile
	 - Platform
	 - Wall (Which Direction can be passed
*/
GRID_SIZE = 64;

#region GA_TILES
var tileCount = 0;

//[0]EMPTY
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = false; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[1]SOLID
ga_tiles[tileCount,0] = true; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = false; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[2]1x1 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[3]1x1 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[4]1x2 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[5]2x2 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[6]1x2 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[7]2x2 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[8]1x3 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[9]2x3 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[10]3x3 Slope Upwards /
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[11]1x3 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[12]2x3 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[13]3x3 Slope Downwards \
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = true; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[14]Platform
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[15]Platform
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[16]Platform
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 0;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[17]Wall
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = -1;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

//[18]Wall
ga_tiles[tileCount,0] = false; //Solid
ga_tiles[tileCount,1] = false; //Slope
ga_tiles[tileCount,2] = true; //Platform
ga_tiles[tileCount,3] = 1;    //Wall (-1:Can only pass through when walking left, 0:No Wall, 1:Can only pass through when walking right
tileCount ++;

#endregion
totalTiles = (sprite_get_width(spr_collision) / GRID_SIZE);
//Make Tile layer
var layerid = layer_create(0,"Tiles");
tilemapid = layer_tilemap_create(layerid,0,0,ts_collision,totalTiles,1);

//Create Tiles
for (var i = 0; i <= totalTiles; i++){
	tilemap_set(tilemapid, i, i, 0);
}

state = "INIT";



