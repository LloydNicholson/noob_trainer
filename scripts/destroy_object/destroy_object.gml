/// @arg object-other or more specific

var object = argument0;

with object {
	var inst;
	repeat (7) {
		inst = instance_create_layer(x, y, "Instances", o_death_effect);
	}
	global.game_timer = 0;
	global.lose_game = true;
	global.deaths -= 1;
	instance_destroy();
	
	// Play death sound
	var snd_death = audio_play_sound(snd_player_death, 1, false);
	audio_sound_set_track_position(snd_death, 0.5);
}

with o_death_effect {
	vspeed_ = random_range(-jump_speed_+4, -jump_speed_);
	if hspeed_ > 0 {
		hspeed_ -= 0.5;
	} else {
		hspeed_ += 0.5;	
	}
}
