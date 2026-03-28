target = o_player;
shaking = false;
shake_timer = 0;
shake_x_offset = 0;
shake_y_offset = 0;
base_x = x;
base_y = y;

camera_set_view_pos(view_camera[0], x, y);
camera_set_view_border(view_camera[0], 30, 30);

if room == rm_platformer_parent { target = o_player; }
if room == rm_hide_and_seek { target = obj_HdnSeek_Player; }