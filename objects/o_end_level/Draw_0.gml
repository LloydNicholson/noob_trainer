// Animated colour cycling using sine waves
var r_val = 128 + 127 * dsin(color_angle);
var g_val = 128 + 127 * dsin(color_angle + 120);
var b_val = 128 + 127 * dsin(color_angle + 240);
var c_inner = make_color_rgb(r_val, g_val, b_val);
var c_outer = make_color_rgb(255 - r_val, 255 - g_val, 255 - b_val);

// Outer glow rings (large, transparent)
var pulse1 = rad + 4 + 3 * dsin(pulse_angle);
var pulse2 = rad + 8 + 3 * dsin(pulse_angle + 90);
draw_circle_color(x, y, pulse2, c_white, c_black, false);
draw_set_alpha(0.35);
draw_circle_color(x, y, pulse1, c_outer, c_black, false);
draw_set_alpha(1);

// Core filled circle
draw_circle_color(x, y, rad, c_inner, c_outer, false);

// "EXIT" label above the portal
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text_transformed(x, y - rad - 5, "EXIT", 0.45, 0.45, 0);
draw_set_halign(fa_left);