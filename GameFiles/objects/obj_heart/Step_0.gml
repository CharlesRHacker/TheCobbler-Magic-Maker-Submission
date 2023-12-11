/// @description Insert description here
// You can write your code in this editor


if obj_player.hearts == 5{
	if eyed = 2{
		image_index = 1	
	}
}
if obj_player.hearts == 4{
	if eyed = 2{
		image_speed = .2
	}
}
if obj_player.hearts == 3{
	if eyed = 1{
		image_index = 1	
	}
}
if obj_player.hearts == 2{
	if eyed = 1{
		image_speed = .2
	}
}
if obj_player.hearts == 1{
	if eyed = 0{
		image_index = 1	
	}
}
if obj_player.hearts == 0{
	if eyed = 0{
		image_speed = .2
	}
}

if image_index == 7{
	image_speed = 0
	instance_destroy()	
	
}
