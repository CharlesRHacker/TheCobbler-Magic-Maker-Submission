grv = .45; //gravity
hsp = 0; //current horizontal speed
vsp = 0; //current vertical speed
hsp_walk = 3; //walk speed
vsp_jump = -12; //jump speed
lanterns = 0
madeit = 0
passthrough = false
canshoot = true
shoottimer = 0
hearts = 6
timethru = 0
heartflag = false
othershottriggered = 0
shots = 0
bosstimer = 0
inplace = false
started = false
timestart = false
timeswitch = false
reachedbottom = false
curlevel = 0
justhit = false

global.curcolor = 0
global.moved = false
global.tutorial = 1
global.done = false

//make floors for level
bossFloorsConfig = ds_list_create();
id1 = instance_create_depth(280, 240, 1, obj_bluefloor)
ds_list_add(bossFloorsConfig, id1)
id2 = instance_create_depth(200, 300, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfig, id2)
id3 = instance_create_depth(320, 300, 1, obj_redfloor)
ds_list_add(bossFloorsConfig, id3)
id4 = instance_create_depth(120, 360, 1, obj_redfloor)
ds_list_add(bossFloorsConfig, id4)
id5 = instance_create_depth(240, 360, 1, obj_bluefloor)
ds_list_add(bossFloorsConfig, id5)
id6 = instance_create_depth(360, 360, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfig, id6)
id7 = instance_create_depth(40, 420, 1, obj_bluefloor)
ds_list_add(bossFloorsConfig, id7)
id8 = instance_create_depth(180, 420, 1, obj_yellowfloor)
ds_list_add(bossFloorsConfig, id8)
id9 = instance_create_depth(300, 420, 1, obj_redfloor)
ds_list_add(bossFloorsConfig, id9)

boss1 = instance_create_depth(600,360,1,obj_startfloor)
boss1.image_xscale = 5.5
ladder1 = instance_create_depth(725, 360, 1, obj_ladder)
boss2 = instance_create_depth(600,240,1,obj_startfloor)
boss2.image_xscale = 3
ladder2 = instance_create_depth(600, 240, 1, obj_ladder)
boss3 = instance_create_depth(540,120,1,obj_startfloor)
boss3.image_xscale = 1.5

floor1checkpoints = ds_list_create();
for (i = 45; i<=312; i+=89){
	ds_list_add(floor1checkpoints, i+600)	
}

floor2checkpoints = ds_list_create();
for (i = 30; i<=158; i+= 64){
	ds_list_add(floor2checkpoints, i+600)	
}

timestomove = ds_list_create();
for (i = 3; i<=6; i++){
	ds_list_add(timestomove, i*30)	
}