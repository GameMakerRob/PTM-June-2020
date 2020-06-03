/// @function scr_change_option(current, min, max, increment)									
/// @description Return the new value of a variable after pressing up/down
/// @param {real} current - the current value of the variable we're changing
/// @param {real} min - the minimum value that this variable can be
/// @param {real} max - the maximum value that this variable can be
/// @param {real} increment - the amount to increase or decrease the value by					

var current_value = argument0;
var min_value = argument1;
var max_value = argument2;
var increment = argument3;

if global.HELD_DOWN || global.HELD_RIGHT{
		   
	current_value += increment;																	
	
	if (current_value > max_value){															
		var diff = ( (current_value - max_value) - 1);
		current_value = min_value + diff;
	}
}
	
if global.HELD_UP|| global.HELD_LEFT{

	current_value -= increment;																		
	
	if (current_value < min_value){															
		var diff = ( (min_value - current_value) - 1);
		current_value = max_value - diff;
	}
}

return(current_value);