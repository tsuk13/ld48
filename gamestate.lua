--sector specifications
sectors = {
	lsl_113 = {
		name = "lsl-113",
		x = 0,
		y = 0,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "red_duo",
				heading = 90,
			},
			{
				sector_name = "sand_giant",
				heading = 180,
			},
		},
		objects = {
			{
				spr = 9,
				x = 7,
				y = 7,
			},
		},
	},
	red_duo = {
		name = "red duo",
		x = 0,
		y = 16,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "big_blue",
				heading = 90,
			},
			{
				sector_name = "the_pins",
				heading = 135,
			},
			{
				sector_name = "lsl_113",
				heading = 270,
			},
		},
		objects = {
			{
				spr = 10,
				x = 6,
				y = 22,
			},
			{
				spr = 11,
				x = 11,
				y = 29,
			},
		},
	},
	sand_giant = {
		name = "sand giant",
		x = 0,
		y = 32,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "the_pins",
				heading = 90,
			},
			{
				sector_name = "lsl_113",
				heading = 0,
			},
		},
		objects = {
			{
				spr = 12,
				x = 7,
				y = 39,
			},
			{
				spr = 41,
				x = 9,
				y = 38,
			},
		},
	},
	the_pins = {
		name = "the pins",
		x = 0,
		y = 48,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "the_deep",
				heading = 90,
			},
			{
				sector_name = "sand_giant",
				heading = 270,
			},
			{
				sector_name = "red_duo",
				heading = 315,
			},
		},
	},
	big_blue = {
		name = "big blue",
		x = 16,
		y = 0,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "the_deep",
				heading = 135,
			},
			{
				sector_name = "red_duo",
				heading = 270,
			},
		},
	},
	the_deep = {
		name = "the deep",
		x = 16,
		y = 16,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "two_hearts",
				heading = 135,
			},
			{
				sector_name = "two_minds",
				heading = 180,
			},
			{
				sector_name = "the_pins",
				heading = 270,
			},
			{
				sector_name = "big_blue",
				heading = 315,
			},
		},
	},
	two_hearts = {
		name = "two hearts",
		x = 16,
		y = 32,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "dying_light",
				heading = 180,
			},
			{
				sector_name = "the_deep",
				heading = 315,
			},
		},
	},
	two_minds = {
		name = "two minds",
		x = 16,
		y = 48,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "lsl_112",
				heading = 135,
			},
			{
				sector_name = "the_deep",
				heading = 0,
			},
		},
	},
	dying_light = {
		name = "dying light",
		x = 32,
		y = 0,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "lsl_112",
				heading = 180,
			},
			{
				sector_name = "two_hearts",
				heading = 0,
			},
		},
	},
	lsl_112 = {
		name = "lsl-112",
		x = 32,
		y = 16,
		w = 16,
		h = 16,
		warp_datas = {
			{
				sector_name = "two_minds",
				heading = 315,
			},
			{
				sector_name = "dying_light",
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
current_sector = sectors.lsl_113

function reset_camera()
	camera_x = player.x
	camera_y = player.y
    camera_target_x = player.x
	camera_target_y = player.y
end