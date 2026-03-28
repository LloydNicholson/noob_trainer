/// @desc Set room start position
randomize();
if !instance_exists(target) {
	var start_x = global.start_position.x;
	var start_y = global.start_position.y;

	instance_create_layer(start_x, start_y, "Instances", target);
} else {
	global.start_position.x = target.x;
	global.start_position.y = target.y;
}

global.lose_game = false;
global.draw_game = false;
global.game_timer = global.game_speed*global.seconds;
global.max_timer = global.game_timer;
death_message = choose(
	"OOPS! TRY AGAIN!",
	"SO CLOSE... NOT REALLY.",
	"BOOM! RESPECT THE SPIKES.",
	"EVERY EXPERT WAS ONCE A NOOB!",
	"FASTER NEXT TIME!",
	"THE PLATFORMS AREN'T THAT HARD... RIGHT?",
	"YOU'LL GET IT!",
	"KEEP GOING!",
	"NICE TRY, SERIOUSLY THOUGH!"
);