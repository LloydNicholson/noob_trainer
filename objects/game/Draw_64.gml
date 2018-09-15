if room == rm_game_over exit;
/// @desc Draw Game GUI
draw_set_font(f_game);
// Game cursor
cursor_sprite = cr_none;

// GUI vars
var gui_height = display_get_gui_height();
var gui_width = display_get_gui_width();

// Timer sprite vars
var timer_width = sprite_get_width(s_timer_UI);
var timer_height = sprite_get_height(s_timer_UI);

// Level sprite vars
var level_width = sprite_get_width(s_level_UI);
var level_height = sprite_get_height(s_level_UI);

// Level text vars
var str = string(global.level);
var str_width = string_width(global.level);
var str_height = string_height(global.level);

#region Level number drawn on all levels
// Level sprite
draw_sprite(s_level_UI, 0, gui_width-level_width-10, gui_height-level_height/2-20);

// Level text
draw_set_halign(fa_center); // Change halign first
draw_text(gui_width-level_width/2-10, gui_height-level_height-6, str);
if room != rm_rock_paper_scissors {
	draw_text(gui_width/2, gui_height-level_height-10, "Max level: " + string(global.max_level));
} else {
	draw_text(gui_width/2+200, gui_height-level_height-10, "Max level: " + string(global.max_level));	
}
draw_set_halign(fa_left); // Set halign back to normal
#endregion

// Step code for every room
#region Death/win/draw message - every room
// Draw this in every room - I want to make the message randomised throughout the game
draw_set_halign(fa_center);
// If you die, draw message 
if global.lose_game {
	var c = c_white;
	draw_text_ext_color(gui_width/2, gui_height/2+60, death_message, 20, 50, c,c,c,c, 1);
} 
	draw_set_halign(fa_left);
#endregion

// Step code for each room
switch room {
	case rm_rock_paper_scissors:
		#region RPS level
		draw_text_ext(10, 10, "YOU KNOW WHAT TO DO, RIGHT?!", 30, 100);
		draw_set_halign(fa_center);
		// Draw timer
		draw_timer(gui_width/2, gui_height/2, -timer_width/2+5, 0, 1, 0, global.game_timer, global.max_timer);		
	
		#region RPS Player
		var _x = gui_width/2;
		var y_offset = timer_height/2;
		var _y = gui_height;
		var scale = 12;
	
		with o_rps_player {
			switch entry {
				case player.rock: 
					draw_text(_x, _y/2+y_offset, "ROCK");
					draw_sprite_ext(s_rock, 0, _x, _y, scale, scale, 0, c_white, 1);
				break;
	
				case player.paper: 
					draw_text(_x, _y/2+y_offset, "PAPER");
					draw_sprite_ext(s_paper, 0, _x, _y, scale, scale, 0, c_white, 1);
				break;
	
				case player.scissors:
					draw_text(_x, _y/2+y_offset, "SCISSORS");
					draw_sprite_ext(s_scissors, 0, _x, _y, scale, scale, 0, c_white, 1);
				break;
			}
		}
	#endregion
	
		#region RPS Enemy
		var y_offset = timer_height/2;
		var _y = 0;
		var scale = 14;
	
		with o_rps_enemy {
			var rot = 180;
			switch entry {
				case enemy.rock: 
					draw_sprite_ext(s_rock, 0, _x, _y, scale, scale, rot, c_white, 1);
				break;
	
				case enemy.paper: 
					draw_sprite_ext(s_paper, 0, _x, _y, scale, scale, rot, c_white, 1);
				break;
	
				case enemy.scissors:
					draw_sprite_ext(s_scissors, 0, _x, _y, scale, scale, rot, c_white, 1);
				break;
			}
		}
	#endregion
		
		draw_set_halign(fa_left); // Set halign back to normal
		#endregion	
	break;
	
	case rm_dodging: 
		#region Dodging Room
		draw_text_ext(10, 10, "PRESS SPACEBAR TO ATTACK. OBVIOUSLY DUDE!", 30, 100);
		
		with obj_ChatBoss {
			if vulnerable <= 150 {
				draw_text(gui_width/2-50, gui_height/2-90, "GET 'EM!");	
			}
		}
		#endregion
	break;
	
	case rm_hide_and_seek: 
		#region Hide and Seek Room
		
		
		// Timer
		draw_timer(20, gui_height, 0, -timer_height/2-20, 1, 0, global.game_timer, global.max_timer);

		draw_text_ext(10, 10, "FIND THE SCREEN. IT'S HIDE AND SEEK! DUH!", 30, 100);
		#endregion
	break;
	
	default: 
		#region Platformer parent level
	draw_text_ext(10, 10, "FIND THE EXIT. NOOB!", 30, 100);
	// Draw UI sprites
	// Timer
	draw_timer(20, gui_height, 0, -timer_height/2-20, 1, 0, global.game_timer, global.max_timer);
	
	draw_set_halign(fa_center);
	// Death text
	draw_text(gui_width/2, gui_height-40, "Max deaths: " + string(global.deaths));
	draw_set_halign(fa_left);
	#endregion
	break;
}

