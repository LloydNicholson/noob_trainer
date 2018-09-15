/// @arg bounce
var _bounce = argument0;

if place_meeting(x+hspeed_, y, collision_object_) {
	while !place_meeting(x+sign(hspeed_), y, collision_object_) {
		x += sign(hspeed_);
	}
	
	if _bounce {
		hspeed_ = -(hspeed_)*bounce_amount_;
	} else {
		hspeed_ = 0;	
	}
	hspeed_ = 0;
}

x += round(hspeed_);

if place_meeting(x, y+vspeed_, collision_object_) {
	while !place_meeting(x, y+sign(vspeed_), collision_object_) {
		y += sign(vspeed_);	
	}
	
	if _bounce {
		vspeed_ = -(vspeed_)*bounce_amount_;
	} else {
		vspeed_ = 0;	
	}
	vspeed_ = 0;
} 

y += round(vspeed_);