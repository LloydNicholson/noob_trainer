audio_pause_all();
audio_play_sound(snd_hide_and_seek, 10, false);
camera.target = obj_HdnSeek_Player;
game.target = obj_HdnSeek_Player;
global.start_position = i_hide_start;
global.seconds = 33;
o_solid.visible = true;