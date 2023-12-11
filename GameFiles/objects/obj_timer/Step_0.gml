//color orders
if room == room_tutorial or room == room_lvl3 or room == room_test{
	global.redorder = 0
	global.rednext = 1
	global.yelloworder = 1
	global.yellownext = 0
}else if room == room_lvl1 or room == room_lvl2{
	global.yelloworder = 0
	global.yellownext = 1
	global.redorder = 1
	global.rednext = 0
}else if room == room_lvl4 or room == room_boss{
	global.blueorder = 2
	global.bluenext = 0
	global.redorder = 0
	global.rednext = 1
	global.yelloworder = 1
	global.yellownext = 2
}else if room == room_lvl5{
	global.blueorder = 0
	global.bluenext = 1
	global.redorder = 1
	global.rednext = 2
	global.yelloworder = 2
	global.yellownext = 0
}
if global.moved == true and global.done == false{
	global.timer+=(1/30)
}
if global.done == true{
	if best == "N/A" or global.timer<best{
		best = global.timer	
		if room == room_tutorial{
			if best < besttimes[0] besttimes[0] = best	
		}
		if room == room_lvl1{
			if best < besttimes[1] besttimes[1] = best	
		}
		if room == room_lvl2{
			if best < besttimes[2] besttimes[2] = best	
		}
		if room == room_lvl3{
			if best < besttimes[3] besttimes[3] = best	
		}
		if room == room_lvl4{
			if best < besttimes[4]{
				besttimes[4] = best
			}
		}
		if room == room_lvl5{
			if best < besttimes[5] besttimes[5] = best	
		}
	}
	global.done = false
}
if room_get_name(room) != curroom {
	best = "N/A"
	global.timer = 0
	curroom = room_get_name(room)
}

if room == room_chooselevel{
	levelselectheader = true	
}else{
	levelselectheader = false	
}
if room == room_init and (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_anykey)) {
	room_goto(room_chooselevel)	
}
if collision_point(mouse_x, mouse_y, obj_tutorialbut, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_tutorial)	
}
if collision_point(mouse_x, mouse_y, obj_lvl1but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl1)	
}

if collision_point(mouse_x, mouse_y, obj_lvl2but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl2)	
}

if collision_point(mouse_x, mouse_y, obj_lvl3but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl3)	
}

if collision_point(mouse_x, mouse_y, obj_lvl4but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl4)	
}
if collision_point(mouse_x, mouse_y, obj_lvl5but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl5)	
}
if collision_point(mouse_x, mouse_y, obj_boss1button, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_boss)	
}
/*
if collision_point(mouse_x, mouse_y, obj_lvl6but, false, false) and mouse_check_button_pressed(mb_left){
	room_goto(room_lvl6)	
}
*/

