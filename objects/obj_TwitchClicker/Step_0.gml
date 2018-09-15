/// @description When the clicker is clicked, destroy instance and add score

//Clicked and increase score
if mouse_check_button(mb_left) and position_meeting(mouse_x,mouse_y, self) {
    instance_destroy(self);
    audio_play_sound(snd_twitch_lazer,10,false);
    global.twitch_score += 1;
    global.clicker_timer -= 1; //If 5 are not clicked, the game resets
}

