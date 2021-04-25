--sector specifications
sectors = {
	home = {
		x = 0,
		y = 0,
		w = 8,
		h = 8,
		s_warp = {
			{
				sector_name = "red_duo",
				heading = 90,
			},
		},
	},
	red_duo = {
		x = 8,
		y = 0,
		w = 8,
		h = 8,
	}
}
ship_ob = {
	x=119,
	y=0,
	w=9,
	h=9, 
}
current_sector = sectors.home

function reset_camera()
	camera_x = player.x
	camera_y = player.y
    camera_target_x = player.x
	camera_target_y = player.y
end