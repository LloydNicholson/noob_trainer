sprite_index = index[entry];
depth = -10;

var move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left); 
var select = keyboard_check_pressed(vk_enter);

if global.game_timer > 0 {
	switch move {
		case -1: 
			// Moving left
			if entry > 0 { entry -= 1; } 
			else if entry == 0 { entry = max_entry; } 
		break;
	
		case 1:
			// Moving right
			if entry <  max_entry { entry += 1; } 
			else if entry == max_entry { entry = 0; }
		break;
	}
}

if keyboard_check_pressed(ord("R")) {
	room_restart();	
}