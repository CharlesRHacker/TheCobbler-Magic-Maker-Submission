/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_text(400,300, "shootstrength:" + string(shootstrength))
if shootdrawdex != -1{
	draw_sprite(spr_shootbar, shootdrawdex, x, y-20)
}
/*
draw_set_color(c_white)
d
draw_text(400,300, "global.curcolor is " + string(global.curcolor))
draw_text(400, 400, "global.redorder is " + string(global.redorder))
if madeit >0{
	draw_text(400,200, "madeitnum is " + string(madeit)	)
}
*/

