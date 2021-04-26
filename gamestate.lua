--sector specifications
sectors = {
	home = {
		name = "lsl-113",
		x = 0,
		y = 0,
		w = 8,
		h = 8,
		warp_datas = {
			{
				sector_name = "red_duo",
				heading = 90,
			},
			{
				sector_name = "red",
				heading = 180,
			},
		},
	},
	red_duo = {
		name = "red duo",
		x = 8,
		y = 0,
		w = 8,
		h = 8,
		warp_datas = {
			{
				sector_name = "home",
				heading = 270,
			},
		},
	},
	red = {
		name = "Red",
		x = 8,
		y = 0,
		w = 8,
		h = 8,
		warp_datas = {
			{
				sector_name = "home",
				heading = 0,
			},
		},
	},
}
ship_ob = {
	x=112,
	y=0,
	w=16,
	h=16, 
}
current_sector = sectors.home

function reset_camera()
	camera_x = player.x
	camera_y = player.y
    camera_target_x = player.x
	camera_target_y = player.y
end