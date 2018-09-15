// Reset room and change a few things
if room != rm_platformer5 {
global.level += 1;
room_goto(choose(rm_dodging, rm_hide_and_seek, rm_rock_paper_scissors));
global.game_timer = global.max_timer;

if global.level >= global.max_level {
	room_goto(rm_platformer5);		
}

other.vspeed_ = -0.2;
} else {
	room_goto(rm_game_over);	
}

if global.deaths <= 3 {
	global.deaths = 3;
}