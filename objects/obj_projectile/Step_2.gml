if (state == e_monster_states.idle){
	move_towards_point(target.x, target.y, spd);
	state = e_monster_states.attack;
}

//Destroy this instance after a while
death_timer --;

if (death_timer <= 0) instance_destroy();