/// @description Stop at edges, score, timer, win condition
//Execute movement scripts
scr_input();
scr_movement();

//Edges
if x<=4 {
    x=4;
}

if x>= room_width-4 {
    x=room_width-4;
}

if y<=4 {
    y=4;
}

if y>=room_height-4 {
    y=room_height-4;
}



//if keyboard_check_pressed(ord("R")) {
//	room_restart();	
//	global.game_timer = global.max_timer;
//	audio_stop_all();
//}