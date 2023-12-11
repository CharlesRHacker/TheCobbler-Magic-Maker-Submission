


//grav
if reachedbottom == false{
	vsp = vsp + grv;
}



//animation
if hspeed<0{
	sprite_index = spr_walkleft	
}if hspeed>0{
	sprite_index = spr_walkright	
}if hspeed = 0{
	if sprite_index = spr_walkright{
		sprite_index = spr_idleright	
	}else if sprite_index = spr_walkleft{
		sprite_index = spr_idleleft	
	}
}
image_speed = 1.5
if hearts>3{
	image_blend = c_white
}

//ALL collisions
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
x+=hsp


if passthrough == false{
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
}

y+=vsp


depth = -1

//AI code to shoot player
/*

*/

bosstimer+=1	

if justhit == false{
	if curlevel == 0{
		if timestart == false{
			randomtime = irandom(ds_list_size(timestomove) -1);
			nexttime = ds_list_find_value(timestomove, randomtime);
			timestart = true
		}
	
		if bosstimer<nexttime{
			if started == false{
				randomcheck = irandom(ds_list_size(floor1checkpoints) - 1);
				nextcheck = ds_list_find_value(floor1checkpoints, randomcheck);
				started = true
				inplace = false
			}
			if started == true and inplace = false{
				if x!=nextcheck{
					if (distance_to_point(nextcheck, y) < 3) {
						speed = 0;
						inplace = true
						started = false
					}else{
						move_towards_point(nextcheck, y, 3)
					}
				}
			}
		}else{
			if timeswitch == false{
				time1 = bosstimer
				timeswitch = true
			}
			if (bosstimer - time1) >= 30{
				if reachedbottom == false{
					if x!= ladder1.x + 30{
						if (distance_to_point(ladder1.x + 30, y) < 3) {
							speed = 0;
							reachedbottom = true	
						}else{
							move_towards_point(ladder1.x +30 , y, 3)
						}
					}
				}
			}else{
				speed = 0
				sprite_index = spr_idleleft
				if canshoot = true and heartflag == false{
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)	
					a1.which = 0
					canshoot = false
				}else if canshoot = true and heartflag == true{
					othershottriggered = 1;
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)
					a2 = instance_create_depth(x-15, y, 1, obj_arrow)
					a3 = instance_create_depth(x-15, y, 1, obj_arrow)
					a1.which = 0
					a2.which = 1
					a3.which = 2
					canshoot = false
					shoottimer = 0
					shots+=1
				}
			}	
		}
	}

	if reachedbottom == true and curlevel = 0{
		if (distance_to_point(ladder1.x, ladder1.y - 165) < 3) {
			speed = 0;
			reachedbottom = false
			curlevel = 1
			timestart = false
			bosstimer = 0
			started = false
			inplace = false
			timeswitch = false
			canshoot = true
		}else{
			move_towards_point(ladder1.x, ladder1.y - 165, 3)
		}	
	}

	//level2


	if curlevel == 1{
		if timestart == false{
			randomtime = irandom(ds_list_size(timestomove) -1);
			nexttime = ds_list_find_value(timestomove, randomtime);
			timestart = true
		}
	
		if bosstimer<nexttime{
			if started == false{
				randomcheck = irandom(ds_list_size(floor2checkpoints) - 1);
				nextcheck = ds_list_find_value(floor2checkpoints, randomcheck);
				started = true
				inplace = false
			}
			if started == true and inplace = false{
				if x!=nextcheck{
					if (distance_to_point(nextcheck, y) < 3) {
						speed = 0;
						inplace = true
						started = false
					}else{
						move_towards_point(nextcheck, y, 3)
					}
				}
			}
		}else{
			if timeswitch == false{
				time1 = bosstimer
				timeswitch = true
			}
			if (bosstimer - time1) >= 30{
				if reachedbottom == false{
					if x!= ladder1.x{
						if (distance_to_point(ladder1.x, y) < 3) {
							speed = 0;
							reachedbottom = true	
						}else{
							move_towards_point(ladder1.x , y, 3)
						}
					}
				}
			}else{
				speed = 0
				sprite_index = spr_idleleft
				if canshoot = true and heartflag == false{
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)	
					a1.which = 0
					canshoot = false
				}else if canshoot = true and heartflag == true{
					othershottriggered = 1;
					a1 = instance_create_depth(x-15, y, 1, obj_arrow)
					a2 = instance_create_depth(x-15, y, 1, obj_arrow)
					a3 = instance_create_depth(x-15, y, 1, obj_arrow)
					a1.which = 0
					a2.which = 1
					a3.which = 2
					canshoot = false
					shoottimer = 0
					shots+=1
				}
			}	
		}
	}

	if reachedbottom == true and curlevel = 1{
		if (distance_to_point(ladder1.x + 30, ladder1.y - 10) < 3) {
			speed = 0;
			reachedbottom = false
			curlevel = 0
			timestart = false
			bosstimer = 0
			started = false
			inplace = false
			timeswitch = false
			canshoot = true
		}else{
			move_towards_point(ladder1.x + 30, ladder1.y -10, 3)
		}	
	}
}




//backup plan

/*
if heartflag == false{
	if global.timer > 0 and global.timer < .7{
		if hearts<=3{
			global.timer = 0
			heartflag = true	

		}else{
			hsp = -3	
			sprite_index = spr_walkleft
		}
	}else if global.timer<.8{
		hsp = 0	
		sprite_index = spr_idleleft
	}
	if global.timer>.8 and global.timer< 1.3{
		canshoot = false
		hsp = 3
		sprite_index = spr_walkright
	}if global.timer > 1.3 and global.timer < 1.4{
		hsp = 0 
		sprite_index = spr_idleright
	}if global.timer>1.4 and global.timer < 1.6{
		sprite_index = spr_idleleft	
	}if global.timer>1.6 and global.timer< 1.7{
		hsp = -3
		vsp = vsp_jump
		sprite_index = spr_jumpleft
	}if global.timer>2.5 and global.timer< 3.1{
		hsp = -3
		sprite_index = spr_walkleft
	}if global.timer>3.1 and global.timer<5.5{
		hsp = 0
		sprite_index = spr_idleleft
	}if global.timer>5.5 and global.timer< 6.2{
		passthrough = true	
		sprite_index = spr_jumpleft
	}if global.timer>6.2 and global.timer< 10{
		passthrough = false
		sprite_index = spr_idleleft
	}if global.timer>10 and global.timer< 10.1{
		hsp = 3
		vsp = vsp_jump/2
		sprite_index = spr_jumpright
	}if global.timer>10.9 and global.timer< 11.5{
		hsp = 3.8335
		sprite_index = spr_walkright
	}if global.timer>11.5 and global.timer<14{
		hsp = 0
		sprite_index = spr_idleleft
	}if global.timer>14 and global.timer< 14.5{
		passthrough = true
		vsp = vsp_jump*.850
		sprite_index = spr_jumpleft
	}if global.timer>14.5 and global.timer<20{
		passthrough = false
		sprite_index = spr_idleleft
		flag = 0
		if hearts<=3{
			global.timer = 0
			heartflag = true	
		}
	}if global.timer>20 and global.timer<25{
		if flag == 0{
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.direction = 120
			ballid.speed = 15
			if timethru == 0{
				ballid.sprite_index = spr_hballblue
				ballid.col = obj_bluefloor
			}else if timethru == 1{
				ballid.sprite_index = spr_hballyellow
				ballid.col = obj_yellowfloor
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 1
		}if flag==1{
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.direction = 115
			ballid.speed = 19
			if timethru == 0{
				ballid.sprite_index = spr_hballyellow
				ballid.col = obj_yellowfloor
			}else if timethru == 1{
				ballid.sprite_index = spr_hballyellow
				ballid.col = obj_yellowfloor
				ballid.speed = 17.3
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 2
		}if flag==2{
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.direction = 101
			ballid.speed = 30
			if timethru == 0{
				ballid.sprite_index = spr_hballred
				ballid.col = obj_redfloor
			}else if timethru == 1{
				ballid.sprite_index = spr_hballyellow
				ballid.col = obj_yellowfloor
			}
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 3
		}if flag ==3 and timethru == 0{
			ballid = instance_create_depth(x,y,0,obj_henchmanball)	
			ballid.direction = 115
			ballid.speed = 18
			ballid.sprite_index = spr_hballyellow
			ballid.col = obj_yellowfloor
			ballid.image_xscale = .75
			ballid.image_yscale = .75
			flag = 4
		}
	}
	if global.timer>25{
		global.timer = 0
		if timethru = 0 timethru = 1
		else if timethru = 1 timethru = 0
	}
}
if heartflag == true{
	if global.timer< 3{
		image_blend = c_red	
	}
	if global.timer > 3 and global.timer<3.1{
		
		with (all){
			if object_index == obj_yellowfloor or object_index == obj_bluefloor{
				id1 = instance_create_depth(x,y,1, obj_redfloor)
				id1.visible = true
				instance_destroy()
			}
			if object_index == obj_replacefloor{
				instance_destroy()	
			}
		}
	}
	if shots == 2{
			
	}
}
*/











