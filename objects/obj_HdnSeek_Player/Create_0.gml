/// @description Declare variables, start timer and state score
depth = -100;
image_speed = 0.5;
spd = 4;
xaxis=0;
yaxis=0;
win_score = 0;

instance_create_layer(x+10, y+10, "Instances", obj_Treasure);

scr_input();
scr_movement();

