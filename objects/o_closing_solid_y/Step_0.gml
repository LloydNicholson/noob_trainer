if y >= y_max-sprite_height {
	speed_ = -speed_;
} else if y <= y_min {
	speed_ = -speed_;
}

y += round(speed_);