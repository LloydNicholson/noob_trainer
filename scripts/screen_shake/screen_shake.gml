/// @arg x_shake
/// @arg y_shake
/// @arg shake

var x_shake = argument0;
var y_shake = argument1;
var shake = argument2;

with camera {
	if shake { camera.shaking = true; }
	if shaking {
		// Set amount to shake by
		view_xport[0] += random_range(-x_shake, x_shake);
		view_yport[0] += random_range(-y_shake, y_shake);
	} 
}