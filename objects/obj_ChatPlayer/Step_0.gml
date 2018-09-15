/// @description Movement, damage, score

//Move only along edges
if (y >= room_height - 4) || (y <= 4) {
    if keyboard_check(vk_right) {
        x += spd;
    }
   if keyboard_check(vk_left) {
        x -= spd;
    }
}
if x >= room_width - 4 || x <= 4 {
    if keyboard_check(vk_up) {
        y -= spd;   
    }
    if keyboard_check(vk_down) {
        y += spd;   
    }
}

if y >= room_height - 4 {
    y = room_height - 4
}

if y <= 4 {
    y = 4;
}

if x >= room_width - 4 {
    x = room_width - 4
}

if x <= 4 {
    x = 4;
}

//When hit then boss_health goes up
if position_meeting(x,y,obj_ChatFire) {
    obj_ChatBoss.boss_health += 5;
    instance_destroy(obj_ChatFire);
}

