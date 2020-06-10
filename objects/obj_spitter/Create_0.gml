event_inherited(); //inherited from obj_all_actors_PARENT

DETECTION_RADIUS = 300;

state = e_monster_states.idle;
attack_timer = 0;
time_till_attack = irandom_range(1, 3);

defence = 2;
attack = 1;
hp = 3;