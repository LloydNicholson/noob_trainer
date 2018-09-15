/// @description Controls clicker, score and timer
twitch_timer -= 1
end_game_timer -= 1

//When timer runs out then clicker created
if twitch_timer <= 0 {
    instance_create_layer(x,y, "Instances", obj_TwitchClicker);
    global.clicker_timer += 1;
    if end_game_timer <= 2000/2 {
        twitch_timer = 17;
        } else {
        twitch_timer = 18;
        }  //About half way it becomes slightly more difficult
}

//If a clicker is not clicked, life penalty, if 5 are not clicked, the game resets
if global.clicker_timer >= 5 {
    room_restart(); //This should reset the room if they don't click enough in time
    }

//When game timer ends, then move on to the next room
if end_game_timer <= 0 {
    room_goto(rm_platformer_parent);
}

