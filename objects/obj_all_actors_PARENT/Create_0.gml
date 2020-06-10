attack = -1;
defence = -1;
hp = -1;
#macro INVULNERABILITY_TIME (room_speed * 3)

hit_timer = 0; //When someone is hit, their hit timer is set to INVULNERABILITY_TIME and decreases every step
               //they can't ne damaged more whilst their hit timer is > 0
state = e_monster_states.idle;