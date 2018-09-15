/// @description Speed and random direction when created

speed = spd;
direction = rrange1;

//Make sure these disappear when they leave the screen MEMORY LEAK!
if (x >= 68) || (y >= 68) || (x <= -4) || (y <=-4) {
    instance_destroy(self);
};

