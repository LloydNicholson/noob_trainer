if instance_exists(target) {
	// Look-ahead: lead the camera slightly ahead of the player's movement direction
	// Multipliers (8 horizontal, 4 vertical) give a subtle preview of where the player is headed
	var lead_x = 0;
	var lead_y = 0;
	if instance_exists(o_player) {
		lead_x = o_player.hspeed_ * 8;
		lead_y = o_player.vspeed_ * 4;
	}
	
	// Smooth follow with look-ahead on the stable base position
	base_x = lerp(base_x, target.x + lead_x, follow_speed);
	base_y = lerp(base_y, target.y + lead_y, follow_speed);
	
	// Clamp camera so it never shows outside the room boundaries
	// Guard ensures clamping is skipped when the room is smaller than the view
	if room_width > view_w {
		base_x = clamp(base_x, view_w / 2, room_width - view_w / 2);
	}
	if room_height > view_h {
		base_y = clamp(base_y, view_h / 2, room_height - view_h / 2);
	}
}

// shake_duration controls how many frames the camera shake lasts
var shake_duration = 30;

// Decrement shake timer and compute shake offset with decay
if shake_timer > 0 {
	shake_timer -= 1;
	var decay = shake_timer / shake_duration;
	shake_x_offset = random_range(-shake_magnitude_x, shake_magnitude_x) * decay;
	shake_y_offset = random_range(-shake_magnitude_y, shake_magnitude_y) * decay;
	if shake_timer <= 0 {
		shaking = false;
		shake_x_offset = 0;
		shake_y_offset = 0;
	}
} else {
	shake_x_offset = 0;
	shake_y_offset = 0;
}

// Apply base position plus shake offset to the actual camera object position
x = base_x + shake_x_offset;
y = base_y + shake_y_offset;