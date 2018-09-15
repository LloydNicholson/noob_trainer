if x >= x_max-sprite_width {
	speed_ = -speed_;
} else if x <= x_min {
	speed_ = -speed_;
}

x += round(speed_);
