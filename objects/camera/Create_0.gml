scale = 1; // if you want to change view size - bigger is > 1 and smaller is < 1
view_w = global.view_width*scale;
view_h = global.view_height*scale;

// Lower follow_speed gives a smooth, dynamic lag instead of snapping to the player
follow_speed = 0.1;

// Stable base position used for smooth following (separate from shake offset)
base_x = 0;
base_y = room_height;

// Screen shake
shake_timer = 0;
shake_magnitude_x = 0;
shake_magnitude_y = 0;
shake_x_offset = 0;
shake_y_offset = 0;

x = 0;
y = room_height;




