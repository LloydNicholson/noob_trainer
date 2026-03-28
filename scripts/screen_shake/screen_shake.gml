/// @arg x_shake
/// @arg y_shake
/// @arg shake

var x_shake = argument0;
var y_shake = argument1;
var shake = argument2;

with camera {
	if shake {
		shaking = true;
		shake_timer = 30;
		shake_magnitude_x = x_shake;
		shake_magnitude_y = y_shake;
	}
}