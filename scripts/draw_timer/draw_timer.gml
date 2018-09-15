/// @arg x
/// @arg y
/// @arg x_offset
/// @arg y_offset
/// @arg sprite_scale_high_is_smaller
/// @arg rotation
/// @arg time
/// @arg max_time

var _x = argument0;
var _y = argument1;
var x_offset = argument2;
var y_offset = argument3;
var scale = argument4;
var rotation = argument5;
var time_item = argument6;
var max_time_item = argument7;

// Timer
draw_sprite_ext(s_timer_UI, 0, _x+x_offset, _y+y_offset, 1/scale, 1/scale, rotation, c_white, 1);

var timer_filled_width = sprite_get_width(s_timer_UI_fill);
var x_scale = image_xscale*time_item/max_time_item;
if time_item > 0 {
	draw_sprite_ext(s_timer_UI_fill, 0, _x+x_offset, _y+y_offset, x_scale/scale, 1/scale, rotation, c_white, 1);
}