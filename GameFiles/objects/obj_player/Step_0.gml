//Get inputs (1 = pressed, 0 = not pressed)
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_up);
key_restart = keyboard_check_pressed(vk_enter);
key_shoot = keyboard_check_pressed(ord("X"));

if key_restart{
		global.done = false
		global.timer = 0
		global.moved = false
		room_restart()
		generated = 0	
	}

whichwall = noone

if key_right or key_left or key_jump{
	global.moved = true	
}

//Work out where to move horizontally
hsp = (key_right - key_left) * hsp_walk;


//Work out where to move vertically
vsp = vsp + grv;

image_speed = 1.5
//Work out if we should jump
if place_meeting(x,y+1,obj_startfloor) or place_meeting(x,y+1,obj_redfloor) or place_meeting(x,y+1,obj_bluefloor) or place_meeting(x,y+1,obj_yellowfloor) 
{
	whichwall = instance_place(x, y+1, obj_startfloor)
	wallsolid = true
	if whichwall == noone{
		whichwall = instance_place(x, y+1, obj_redfloor)
		if global.curcolor == global.redorder wallsolid = true
		else wallsolid = false
	}
	if whichwall == noone{
		whichwall = instance_place(x, y+1, obj_yellowfloor)	
		if global.curcolor == global.yelloworder wallsolid = true
		else wallsolid = false
	}
	if whichwall == noone{
		whichwall = instance_place(x, y+1, obj_bluefloor)	
		if global.curcolor == global.blueorder wallsolid = true
		else wallsolid = false
	}
	if whichwall != noone{
		if wallsolid == true{
			if key_jump{
				if global.tutorial == 0{
					room_restart()
				}
				
				vsp = vsp_jump; 
				if sprite_index == spr_idleright or sprite_index == spr_walkright{
					sprite_index = spr_jumpright
				}else if sprite_index == spr_idleleft or sprite_index == spr_walkleft{
					sprite_index = spr_jumpleft	
				}
			}
	
			if key_right{
				sprite_index = spr_walkright	
			}else if key_left{
				sprite_index = spr_walkleft	
			}else if hsp == 0{
				if sprite_index = spr_walkright{
					sprite_index = spr_idleright	
				}else if sprite_index = spr_walkleft{
					sprite_index = spr_idleleft	
				}
			}
		}
	}	
	
} else{
		if hsp>0{
			sprite_index = spr_jumpright		
		}else if hsp<0{
			sprite_index = spr_jumpleft		
		}else{
			if sprite_index = spr_idleright or sprite_index = spr_walkright{
				sprite_index = spr_jumpright	
			}else if sprite_index = spr_idleleft or sprite_index = spr_walkleft{
				sprite_index = spr_jumpleft	
			}
		}
}

if sprite_index == spr_jumpright or sprite_index == spr_jumpleft{
	if image_index == 1{
		image_speed = 0	
	}
}

//Check for horizontal collisions and then move if we can
onepixelh = sign(hsp) //moving left or right? right = 1, left = -1.
onepixelv = sign(vsp)

if place_meeting(x+hsp,y,obj_startfloor){
	//move as close as we can
	while (!place_meeting(x+onepixelh, y, obj_startfloor))
	{
		x += onepixelh;
	}
	hsp = 0
}
if global.curcolor == global.redorder{
	if place_meeting(x+hsp,y,obj_redfloor){
	//move as close as we can
		while (!place_meeting(x+onepixelh, y, obj_redfloor))
		{
			x += onepixelh;
		}
		hsp = 0
		w = instance_place(x+onepixelh, y, obj_redfloor)
		w.collided = true
	}	
}
if global.curcolor == global.yelloworder{
	if place_meeting(x+hsp,y,obj_yellowfloor){
	//move as close as we can
		while (!place_meeting(x+onepixelh, y, obj_yellowfloor))
		{
			x += onepixelh;
		}
		hsp = 0
		w = instance_place(x+onepixelh, y, obj_yellowfloor)
		w.collided = true
	}	
}
if global.curcolor == global.blueorder{
	if place_meeting(x+hsp,y,obj_bluefloor){
	//move as close as we can
		while (!place_meeting(x+onepixelh, y, obj_bluefloor))
		{
			x += onepixelh;
		}
		hsp = 0
		w = instance_place(x+onepixelh, y, obj_bluefloor)
		w.collided = true
	}	
}	

x+=hsp

if place_meeting(x, y + vsp, obj_startfloor)
{
	while (!place_meeting(x, y + onepixelv, obj_startfloor))
	{
		y += onepixelv;
	}
	vsp = 0
	if (sprite_index == spr_jumpright)
	{
		sprite_index = spr_idleright;
	}
	else if (sprite_index == spr_jumpleft)
	{
		sprite_index = spr_idleleft;
	}
} 
if global.curcolor == global.redorder{
	if place_meeting(x, y + vsp, obj_redfloor)
	{
		while (!place_meeting(x, y + onepixelv, obj_redfloor))
		{
			y += onepixelv;
		}
		vsp = 0
		w = instance_place(x, y + onepixelv, obj_redfloor)
		w.collided = true
		if (sprite_index == spr_jumpright)
		{
			sprite_index = spr_idleright;
		}
		else if (sprite_index == spr_jumpleft)
		{
			sprite_index = spr_idleleft;
		}
	} 
}
if global.curcolor == global.yelloworder{
	if place_meeting(x, y + vsp, obj_yellowfloor)
	{
		while (!place_meeting(x, y + onepixelv, obj_yellowfloor))
		{
			y += onepixelv;
		}
		vsp = 0
		w = instance_place(x, y + onepixelv, obj_yellowfloor)
		w.collided = true
		if (sprite_index == spr_jumpright)
		{
			sprite_index = spr_idleright;
		}
		else if (sprite_index == spr_jumpleft)
		{
			sprite_index = spr_idleleft;
		}
	} 
}	
if global.curcolor == global.blueorder{
	if place_meeting(x, y + vsp, obj_bluefloor)
	{
		while (!place_meeting(x, y + onepixelv, obj_bluefloor))
		{
			y += onepixelv;
		}
		vsp = 0
		w = instance_place(x, y + onepixelv, obj_bluefloor)
		w.collided = true
		if (sprite_index == spr_jumpright)
		{
			sprite_index = spr_idleright;
		}
		else if (sprite_index == spr_jumpleft)
		{
			sprite_index = spr_idleleft;
		}
	} 
}	
y+=vsp


if keyboard_check_pressed(ord("C")){
	if lanterns<=3 {
		if sprite_index == spr_idleright or sprite_index == spr_walkright or sprite_index == spr_jumpright{
			if !place_meeting(x+15, y-10, obj_lantern){
				instance_create_depth(x + 15, y - 10, 0, obj_lantern)
				lanterns++
			}
		}else{
			if !place_meeting(x-15, y-10, obj_lantern){
				instance_create_depth(x - 15, y - 10, 0, obj_lantern)
				lanterns++
			}
		}
		
	}
}

if key_shoot{
	shootstrength = 5	
	shootdrawdex = 0
}


if keyboard_check(ord("X")) and shootstrength< 15{
	shootstrength+=.5
	shootdrawdex+=1	

}

if keyboard_check_released(ord("X")){
	if sprite_index == spr_idleright or sprite_index == spr_walkright or sprite_index == spr_jumpright{
		if !place_meeting(x+15, y-10, obj_lantern){
			shot = instance_create_depth(x + 15, y - 10, 0, obj_hammer)
			shot.direction = 45
			shot.speed = shootstrength
			shot.dir = 1
		}
	}else{
		if !place_meeting(x-15, y-10, obj_lantern){
			shot = instance_create_depth(x - 15, y - 10, 0, obj_hammer)
			shot.direction = 135
			shot.speed = shootstrength
			shot.dir = 0
		}
	}
	shootdrawdex = -1
}

if y>room_height{
	global.timer = 0
	room_restart()	
}
depth = -1

