/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y-1, obj_player){
	global.done = true	
	if generated == 0{
			instance_destroy(obj_textbox)
			instance_create_depth(200,50, -1,obj_textbox)
			obj_textbox.textnum=4
			generated = 1
		}
	/*
	if room== room_tutorial{
		room_goto(room_lvl2)	
	}else if room == room_lvl2{
		room_goto(room_lvl3)	
	}else if room == room_lvl3{
		room_goto(room_lvl4)	
	}else if room == room_lvl4{
		room_goto(room_lvl6)	
	}
	*/
}
if generated == 1{
	if keyboard_check_pressed(vk_enter){
		global.done = false
		global.timer = 0
		global.moved = false
		room_restart()
		generated = 0	
	}
	
}



