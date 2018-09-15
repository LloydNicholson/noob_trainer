instance_create_layer(room_width/2, 0, "Instances", o_rps_enemy);

enum player {
	rock,
	paper,
	scissors
}

index = [s_rock, s_paper, s_scissors];
entry = player.rock;
sprite_index = index[entry];

max_entry = array_length_1d(index)-1;

win_score = 5;