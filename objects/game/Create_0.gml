randomize();
// Set game variables
global.game_speed = game_get_speed(gamespeed_fps);
global.level = 0;
global.start_position = i_level_1_start;
global.seconds = 16;
global.deaths = 3;
global.max_level = 10;

// View variables
global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

// Create objects in game
instance_create_layer(x, y, "Instances", camera);

// Who the game object creates
target = o_player;

// Set cursor sprite
window_set_cursor(cr_none);

// Trying to set up array for death message
win_message = "NOT BAD FOR A NOOB...";

