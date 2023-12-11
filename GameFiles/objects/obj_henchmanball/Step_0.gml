if place_meeting(x,y,obj_redfloor){
	inst = instance_place(x,y,obj_redfloor)
	inst2 = instance_place(x,y,obj_replacefloor)
	inst3 = instance_create_depth(inst.x,inst.y,0,col)
	inst3.visible = true
	with (inst){
		instance_destroy()	
	}
	with (inst2){
		instance_destroy()
	}
	instance_destroy()
}

if place_meeting(x,y,obj_yellowfloor){
	inst = instance_place(x,y,obj_yellowfloor)
	inst2 = instance_place(x,y,obj_replacefloor)
	inst3 = instance_create_depth(inst.x,inst.y,0,col)
	inst3.visible = true
	with (inst){
		instance_destroy()	
	}
	with (inst2){
		instance_destroy()
	}
	instance_destroy()
}

if place_meeting(x,y,obj_bluefloor){
	inst = instance_place(x,y,obj_bluefloor)
	inst2 = instance_place(x,y,obj_replacefloor)
	inst3 = instance_create_depth(inst.x,inst.y,0,col)
	inst3.visible = true
	with (inst){
		instance_destroy()	
	}
	with (inst2){
		instance_destroy()
	}
	instance_destroy()
}

vspeed+= grav