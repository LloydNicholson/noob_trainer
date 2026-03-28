draw_sprite(s_title_highlight, selection, x_pos, y_pos);

// Controls hint at the bottom of the title screen
draw_set_font(f_game);
draw_set_halign(fa_center);
draw_set_color(c_ltgray);
draw_text_transformed(room_width / 2, room_height - 12, "ARROW KEYS TO MOVE  |  UP TO JUMP  |  ENTER TO SELECT", 0.22, 0.22, 0);
draw_set_halign(fa_left);
draw_set_color(c_white);