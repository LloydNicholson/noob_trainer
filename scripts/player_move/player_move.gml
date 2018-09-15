var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
var vinput = keyboard_check(vk_down) - keyboard_check(vk_up);

// Move player left and right
if hinput != 0 {
	if hinput > 0 {
		hspeed_ = 1;
	} else {
		hspeed_ = -1;
	}
	image_speed = 0.8;
} else {
	hspeed_ = 0;	
	image_index = 0;
}

var inst_x = instance_place(x, y+1, o_closing_solid);
var inst_y = instance_place(x, y+1, o_closing_solid_y);

// Check for collision with moving platforms
if inst_x != noone {
	hspeed_ = inst_x.speed_;	
}

if inst_y != noone {
	vspeed_ = inst_y.speed_;	
}

var on_ground = place_meeting(x, y+1, collision_object_);

if on_ground {
	sprite_index = s_player;
	
	if keyboard_check_pressed(vk_up) {
		vspeed_ = -jump_speed_;
		// Jump Sound
		audio_play_sound(snd_platformer_jump, 1, false);
		
	} 
} else {
	sprite_index = s_player_jump;
	image_index = 0;
	
	if keyboard_check_released(vk_up) && (vspeed_ < vspeed_/3) {
		vspeed_ = vspeed_/3;
	}
	
	vspeed_ += gravity_;
}
