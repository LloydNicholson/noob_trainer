
if keyboard_check_pressed(ord("G")) {
	game_restart();
}

if keyboard_check_pressed(vk_escape) {
	game_end();	
}

//if keyboard_check_pressed(ord("N")) {
//	room_goto_next();	
//}

//if keyboard_check_pressed(ord("P")) {
//	room_goto_previous();	
//}


if room != rm_game_over {		
	// Timer
	global.game_timer -= 1;

	switch room {
		case rm_rock_paper_scissors:
			#region RPS Room

		if global.game_timer <= 0 {
			if (o_rps_player.entry == player.rock) and (o_rps_enemy.entry == enemy.scissors) {
				global.lose_game = false;
				audio_play_sound(snd_rock, 10, false);
			} else if (o_rps_player.entry == player.paper) and (o_rps_enemy.entry == enemy.rock) {
				global.lose_game = false;
				audio_play_sound(snd_paper, 10, false);
			} else if (o_rps_player.entry == player.scissors) and (o_rps_enemy.entry == enemy.paper) {
				global.lose_game = false;
				audio_play_sound(snd_scissors, 10, false);
			} else if (o_rps_player.entry == o_rps_enemy.entry) {
				global.draw_game = true;
			} else {
				global.lose_game = true;
			}

			if global.game_timer == 0 {
				// Lose
				if global.lose_game {
					if global.level > 3 {
						global.level -= 1;
					}
					audio_play_sound(snd_rps_round_lose, 2, false);
				} else {
					// Win
					global.level += 1;
					if global.level != global.max_level {
						room_goto(choose(rm_platformer_parent, rm_platformer1, rm_platformer2));
					} else {
						if global.level >= global.max_level {
							room_goto(rm_platformer5);	
						}
					}
					audio_play_sound(snd_rps_round_win, 2, false);
				}
			}
		
			o_rps_player.sprite_index = o_rps_player.entry;
			o_rps_enemy.sprite_index = o_rps_enemy.entry;	
		
			// Countdown until game restarts
			if global.game_timer < -30 {
				global.game_timer = global.max_timer;	
				death_message = "";
			}
		} 	
	#endregion
		break;
	
		case rm_dodging:
			#region Dodging Room
		with obj_control {
			/// @description Control when the boss fires and when player shoots
			boss_fire -= 1;
			//Boss Firing!
			if boss_fire <= 0 {
				instance_create_layer(obj_ChatBoss.x, obj_ChatBoss.y, "Instances", obj_ChatFire);
				boss_fire = 5;
			}

			player_fire -= 1;
			//Player Firing only allowed when boss is vulnerable
			if obj_ChatBoss.vulnerable <= 150 {
				if (keyboard_check_pressed(vk_space)) and (player_fire <= 0) {
					instance_create_layer(obj_ChatPlayer.x, obj_ChatPlayer.y, "Instances", obj_PlayerFire);
					player_fire = 18;
				}
			}

			//Play vulnerable SFX when vulnerable
			if obj_ChatBoss.vulnerable = 150 {
				audio_play_sound(snd_vulnerable_boss,10,false)
			}
	
		}
	
		with obj_ChatBoss {
			//When the boss dies and max health
			if boss_health <= 0 {
				if global.level != global.max_level {
					room_goto(choose(rm_platformer3, rm_platformer4, rm_platformer1));
				} else {
					if global.level >= global.max_level {
						room_goto(rm_platformer5);	
					}
				}
				global.level += 1;
			}

			if boss_health >= 100 {
				boss_health = 100;
			}
		}
		#endregion
		break;
	
		case rm_hide_and_seek: 
		#region Hide and Seek Room
			with obj_HdnSeek_Player {
				//score increase on collision
				if position_meeting(x,y,obj_Treasure) {
					win_score += 1;
					audio_play_sound(snd_collision_hide_and_seek, 1, false);
				}

				//If the timer runs out, lose.
				if global.game_timer <= 0 {
					global.lose_game = true;
					win_score = 0;
					spd = 0;
					room_goto(choose(rm_platformer2, rm_platformer3));
				}

				//Winning condition and go to next room
				if win_score >= 100 {
					if global.level != global.max_level {
						room_goto(choose(rm_platformer2, rm_platformer3, rm_platformer4));
					} else {
						if global.level >= global.max_level {
							room_goto(rm_platformer5);	
						}
					}
					global.level += 1;
				}
			}	
			#endregion
		break;
	
		default: 
			#region Platformer Rooms
		if instance_exists(o_player) {
			if global.game_timer <= 0 {
				// Player is killed by destroy object script
				destroy_object(o_player);
			} 
		} 
	
		// Set a timer for game to restart
		if global.lose_game {
				// Player is dead - shake screen and restart
				screen_shake(5, 5, true);
				if global.game_timer < -20 {
					global.game_timer = global.max_timer;
					room_goto(room);
			}
		} 
	
		// Lost and then decrease deaths by one
		if global.deaths == 0 {
				room_goto(choose(rm_rock_paper_scissors, rm_hide_and_seek, rm_dodging));
				global.deaths = 3;
		}
		#endregion
		break;
	} 
}