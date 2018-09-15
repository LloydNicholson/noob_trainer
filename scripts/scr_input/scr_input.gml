GPxaxis = gamepad_axis_value(0, gp_axislh);
GPyaxis = gamepad_axis_value(0, gp_axislv);

///scr_input
left_key = (keyboard_check(vk_left)) or (keyboard_check(ord("A")) or -(GPxaxis));
right_key = (keyboard_check(vk_right)) or (keyboard_check(ord("D"))or GPxaxis);
up_key = (keyboard_check(vk_up)) or (keyboard_check(ord("W"))or -(GPyaxis));
down_key = (keyboard_check(vk_down)) or (keyboard_check(ord("S"))or GPyaxis);

//get axis
xaxis = (right_key - left_key);
yaxis = (down_key - up_key);

// exit
key_exit = (keyboard_check(vk_escape));

/*
//Check for Gamepad input
if (gamepad_is_connected(0)) {
 gamepad_set_axis_deadzone(0, 0.35);
   xaxis = gamepad_axis_value(0, gp_axislh);
   yaxis = gamepad_axis_value(0, gp_axislv);
}
*/
