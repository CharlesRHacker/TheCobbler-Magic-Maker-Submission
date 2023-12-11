/// @description Insert description here
// You can write your code in this editor
if count != -1{
	count+=.1	
}
if place_meeting(x, y, obj_player){
	visible = true	
}

if collided and wason == false{
	if global.curcolor = global.redorder{
		visible = true
		wason = true
		count = 0
		replacewall = instance_create_depth(x,y, 10, obj_replacefloor).id
		replacewall.image_xscale = image_xscale
		replacewall.image_yscale = image_yscale
		global.curcolor = global.rednext
	}
}
/*
if wason == true and !place_meeting(x, y-1, obj_player) and !place_meeting(x, y+1, obj_player) and !place_meeting(x+1, y, obj_player) and !place_meeting(x-1, y, obj_player) and !place_meeting(x-1, y-1, obj_player) and !place_meeting(x+1, y-1, obj_player){
	instance_destroy(replacewall)
	wason = false
	collided = false
}
*/
if wason == true and !collision_circle(obj_player.x,obj_player.y, 26 , self, false, false) and count > 2 {
	instance_destroy(replacewall)
	wason = false
	collided = false
	count = -1
}