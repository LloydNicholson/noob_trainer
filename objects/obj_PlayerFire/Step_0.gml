///Moves towards the boss
move_towards_point(obj_ChatBoss.x,obj_ChatBoss.y, 0.5);

//Updated here so that hits actually do damage. This is removed from ChatBoss
//When to take damage
if obj_ChatBoss.vulnerable <= 150 {
    if position_meeting(x,y,obj_ChatBoss) {
        obj_ChatBoss.boss_health -= 7;
        audio_play_sound(snd_dodging_hit, 10,false);
        instance_destroy(self);
    };
    if obj_ChatBoss.vulnerable <= 0 {
        obj_ChatBoss.vulnerable = 300;
    };
};

//For those left over ones that don't destroy from a hit
if position_meeting(x,y,obj_ChatBoss) {
    instance_destroy(self);
};
