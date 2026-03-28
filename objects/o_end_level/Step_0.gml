rad += speed_;

if rad > r_offset {
	speed_ = -speed_;	
} else if rad < l_offset {
	speed_ = -speed_;	
}

// Advance pulse and color angles each frame
pulse_angle = (pulse_angle + 4) mod 360;
color_angle = (color_angle + 2) mod 360;