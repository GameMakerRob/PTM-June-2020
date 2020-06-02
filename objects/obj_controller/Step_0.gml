if (keyboard_check(vk_left) || keyboard_check(ord("A")) ) global.HELD_LEFT = true; else global.HELD_LEFT = false;
if (keyboard_check(vk_right) || keyboard_check(ord("D")) ) global.HELD_RIGHT = true; else global.HELD_RIGHT = false;
if (keyboard_check(vk_up) || keyboard_check(ord("W")) ) global.HELD_UP = true; else global.HELD_UP = false;
if (keyboard_check(vk_down) || keyboard_check(ord("S")) ) global.HELD_DOWN = true; else global.HELD_DOWN = false;