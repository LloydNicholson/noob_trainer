/// @description Treasure moves on x and bounces off walls, increase speed with time and timer run down
/// Also to restart the game and move to the next room.

//Movement
x += treasure_spd;
if x <= 5 {
    x -= treasure_spd;
    treasure_spd = -1*treasure_spd;
} else if x >= room_width - 5 {
    x -= treasure_spd;
    treasure_spd = -1*treasure_spd;
};

y += treasure_spdY;
if y <= 5 {
    y -= treasure_spdY;
    treasure_spdY = -1*treasure_spdY;
} else if y >= room_height - 5 {
    y -= treasure_spdY;
    treasure_spdY = -1*treasure_spdY;
};

