/// @description Insert description here
// You can write your code in this editor
if count != -1{
	count+=.1	
}
if place_meeting(x, y, obj_player){
	visible = true	
}

if collided and wason == false{
	if global.curcolor == global.blueorder{
		visible = true
		wason = true
		count = 0
		replacewall = instance_create_depth(x,y, 10, obj_replacefloor).id
		replacewall.image_xscale = image_xscale
		replacewall.image_yscale = image_yscale
		replacewall.image_angle = image_angle
		global.curcolor = global.bluenext
	}
}

if wason == true and !collision_circle(obj_player.x,obj_player.y, 27 , self, false, false) and count> 2 {
	instance_destroy(replacewall)
	wason = false
	collided = false
	count = -1
}