/// @description scr_movement
scr_input();

//get direction
var dir = point_direction(0, 0, xaxis, yaxis);

//get length
if  (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
}

// get hspd and vspd
hspd = lengthdir_x(len, dir);
vspd = lengthdir_y(len, dir);

//move
x += hspd;
y += vspd;


//stop animation
if (!down_key and !up_key and !left_key and !right_key) {
    image_index = 0; 
}

//escape to exit
if (key_exit) {
    game_end();
}  
