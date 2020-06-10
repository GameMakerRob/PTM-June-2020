event_inherited(); //inherited from obj_all_actors_PARENT

DETECTION_RADIUS = 200; //How close does the player need to be for the bat to attack them?
idle_timer = 0;
HOVER_POWER = 2; //How much "bounce" should the bat have

state = e_monster_states.idle;
detection_timer = 0;
target_x = x;
target_y = y;
start_y = y;

MOVE_SPEED = 3;
FLY_PAST_VALUE = 100; //How many pixels should the bat fly past

//Testing / Bug fixing
total_x_dist = abs ( target_x - x) + FLY_PAST_VALUE;
x_dist = total_x_dist; //x_dist will decrease as the distance is travelled

defence = 2;
attack = 2;
hp = 2;