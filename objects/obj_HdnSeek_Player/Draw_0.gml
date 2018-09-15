/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_halign(fa_center);
//Either draw the score and bar or restart text
if global.lose_game = false {
	draw_text_transformed(x + 10 , y-10, string(win_score), 0.5, 0.5, 0);	
} 
draw_set_halign(fa_left);