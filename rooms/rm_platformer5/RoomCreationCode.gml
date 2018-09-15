audio_pause_all();
audio_play_sound(snd_platformer_main_fast, 10, true);
global.seconds = 15;
global.game_timer = global.seconds*global.game_speed;
global.start_position = i_level_5_start;
game.target = o_player;
camera.target = o_player;
