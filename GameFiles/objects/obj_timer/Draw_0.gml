draw_set_color(c_white)
str = string("Best Time: ") + string(best)
str2 = string("Elapsed Time: ") + string(global.timer)
if room !=room_init and room != room_tutorial and room!= room_boss{
	draw_text(750,0,str2)
	draw_text(850,0,str)
}

if room == room_tutorial and colorvis == true{
	if global.curcolor == global.redorder{
		draw_sprite(spr_reddot, 1, 450,0)
		draw_sprite(spr_yellowdot, 0, 475,0)
	}else{
		draw_sprite(spr_reddot, 0, 450,0)
		draw_sprite(spr_yellowdot, 1, 475,0)
	}
}

if room == room_lvl1 or room == room_lvl2 or room==room_test{
	if global.curcolor == global.redorder{
		draw_sprite(spr_reddot, 1, 475,0)
		draw_sprite(spr_yellowdot, 0, 450,0)
	}else{
		draw_sprite(spr_reddot, 0, 475,0)
		draw_sprite(spr_yellowdot, 1, 450,0)
	}	
}
if room == room_lvl3{
	if global.curcolor == global.redorder{
		draw_sprite(spr_reddot, 1, 450,0)
		draw_sprite(spr_yellowdot, 0, 475,0)
	}else{
		draw_sprite(spr_reddot, 0, 450,0)
		draw_sprite(spr_yellowdot, 1, 475,0)
	}		
}

if room == room_lvl4 or room == room_boss /*and colorvis == true*/{
	if global.curcolor == global.blueorder{
		draw_sprite(spr_bluedot, 1, 500,0)
		draw_sprite(spr_reddot, 0, 450,0)
		draw_sprite(spr_yellowdot,0,475, 0)
	}else if global.curcolor == global.redorder{
		draw_sprite(spr_bluedot, 0, 500,0)
		draw_sprite(spr_reddot, 1, 450,0)
		draw_sprite(spr_yellowdot, 0, 475, 0)
	}else{
		draw_sprite(spr_bluedot, 0, 500,0)
		draw_sprite(spr_reddot, 0, 450,0)
		draw_sprite(spr_yellowdot, 1, 475, 0)
	}
}

if room == room_lvl5 /*and colorvis == true*/{
	if global.curcolor == global.blueorder{
		draw_sprite(spr_bluedot, 1, 450,0)
		draw_sprite(spr_reddot, 0, 475,0)
		draw_sprite(spr_yellowdot,0,500, 0)
	}else if global.curcolor == global.redorder{
		draw_sprite(spr_bluedot, 0, 450,0)
		draw_sprite(spr_reddot, 1, 475,0)
		draw_sprite(spr_yellowdot, 0, 500, 0)
	}else{
		draw_sprite(spr_bluedot, 0, 450,0)
		draw_sprite(spr_reddot, 0, 475,0)
		draw_sprite(spr_yellowdot, 1, 500, 0)
	}
}

if room == room_boss{
		for(var i = 0; i<obj_player.hearts/2;i++){
			heart = instance_create_depth(25 + 25*i, 495, 1, obj_heart)
			heart.eyed = i
		}
		for(var i = 0; i<obj_henchman.hearts/2; i++){
			heart = instance_create_depth(850 + 25*i, 495, 1, obj_badheart)
			heart.eyed = i
		}

}
if levelselectheader == true{
	draw_sprite(spr_levelselectheader, -1, 480, 10)	
}

if room == room_chooselevel{
	for (var i = 0; i < 3; i++){
		for (var j = 0; j<2; j++){
			if besttimes[i+j] == 100{
				draw_text(160 + 310*j, 160 + 120*i, "best time: N/A")
			}else{
				draw_text(160 + 310*j, 160 + 120*i, "best time: " + string(besttimes[i+j]))
			}
		}
	}	
}

if room == room_boss{
	draw_set_font(Font12)
	if obj_player.hearts == 0{
		draw_text(300,300,"YOU LOST")
	}
	if obj_henchman.hearts == 0{
		draw_text(300,300, "YOU WON")	
	}
	draw_set_font(Font1)
}
