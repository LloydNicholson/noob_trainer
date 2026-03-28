draw_self();
// Dynamic arrow pointing toward the exit to guide the player
if instance_exists(o_end_level) {
	var exit_dir = point_direction(x, y, o_end_level.x, o_end_level.y);
	var arrow_start_offset = 3; // Distance from player centre before the arrow begins
	var arrow_end_offset = 6;   // Distance from player centre where the arrow tip sits
	var hint_x = x + lengthdir_x(arrow_end_offset, exit_dir);
	var hint_y = y + lengthdir_y(arrow_end_offset, exit_dir);
	draw_set_color(c_yellow);
	draw_arrow(x + lengthdir_x(arrow_start_offset, exit_dir), y + lengthdir_y(arrow_start_offset, exit_dir), hint_x, hint_y, 2);
	draw_set_color(c_white);
}