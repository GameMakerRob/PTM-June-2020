/// @function scr_damage(attacker_id, defender_id)	
/// @description Damage something
/// @param {real} attacker_id - instance_id of the thing doing the damage (player / boomerang / projectile)
/// @param {real} defender_id - instance_id of the thing being damaged

var attacker = argument0;
var defender = argument1;

var damage = attacker.attack - defender.defence;

if (damage > 0){
	defender.hp -= damage;
	defender.hit_timer = INVULNERABILITY_TIME;
}
