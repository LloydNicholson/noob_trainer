var input_down = keyboard_check_pressed(vk_down);
var input_up = keyboard_check_pressed(vk_up);
var select = keyboard_check_pressed(vk_enter);

if selection != -1 {
	if input_down {
		selection = options.end_game;	
		x_pos = 23;
		y_pos = 49;
	} 

	if input_up {
		selection = options.start;
		x_pos = 18;
		y_pos = 38;
	} 
	
	// Ending or starting the game
	switch selection {
		case options.start: 
			if select {
				room_goto(rm_platformer_parent);	
			}
		break;
		case options.end_game: 
			if select {
				game_end();	
			}
		break;
	}
}