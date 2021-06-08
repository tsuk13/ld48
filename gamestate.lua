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
		y = 0,
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
				y = 6,
			},
			{
				spr = 11,
				x = 11,
				y = 13,
			},
		},
	},
	sand_giant = {
		name = "sand giant",
		x = 0,
		y = 0,
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
				y = 7,
			},
			{
				spr = 41,
				x = 9,
				y = 6,
			},
		},
	},
	the_pins = {
		name = "the pins",
		x = 0,
		y = 0,
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
		objects = {
			{
				spr = 27,
				x = 8,
				y = 7,
			},
		},
	},
	big_blue = {
		name = "big blue",
		x = 0,
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
		objects = {
			{
				spr = 14,
				x = 7,
				y = 7,
			},
			{
				spr = 41,
				x = 6,
				y = 6,
			},
			{
				spr = 41,
				x = 7,
				y = 9,
			},
			{
				spr = 41,
				x = 13,
				y = 9,
			},
		},
	},
	the_deep = {
		name = "the deep",
		x = 0,
		y = 0,
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
		objects = {
			{
				spr = 42,
				x = 7,
				y = 7,
			},
			{
				spr = 41,
				x = 8,
				y = 6,
			},
		},
	},
	two_hearts = {
		name = "two hearts",
		x = 0,
		y = 0,
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
		objects = {
			{
				spr = 43,
				x = 4,
				y = 11,
			},
			{
				spr = 44,
				x = 12,
				y = 7,
			},
			{
				spr = 41,
				x = 11,
				y = 6,
			},
		},
	},
	two_minds = {
		name = "two minds",
		x = 0,
		y = 0,
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
		objects = {
			{
				spr = 46,
				x = 10,
				y = 8,
			},
			{
				spr = 47,
				x = 8,
				y = 6,
			},
			{
				spr = 41,
				x = 9,
				y = 5,
			},
		},
	},
	dying_light = {
		name = "dying light",
		x = 0,
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
		objects = {
			{
				spr = 5,
				x = 6,
				y = 6,
			},
		},
	},
	lsl_112 = {
		name = "lsl-112",
		x = 0,
		y = 0,
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
		objects = {
			{
				spr = 25,
				x = 7,
				y = 7,
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