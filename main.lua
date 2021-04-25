function _init()
    start_game()
    --create(player, 0,0)
end

function _update()
    update_input()
    _starfield:update_stars()
	for o in all(objects) do
        o:update()
	end
end

function _draw()
    cls()
    camera()
    _starfield:draw_stars()
    camera(camera_x, camera_y)
	for o in all(objects) do
		if o.base == player then p = o else o:draw() end
	end
    if p.is_char then
        draw_char_ship()
    end
	if p then p:draw() end
    if(p.can_warp) then
        camera()
        print("press x to warp")
        print(p.can_use_ship_helm)
        camera(camera_x, camera_y)
    end
end

function start_game()
    load_sector(current_sector)
    load_sector(ship_ob)
    _starfield:init_stars()
end

function load_sector(sector)
    --create objects
	for i = sector.x, sector.x + sector.w do
		for j = sector.y, sector.y + sector.h do
			for t in all(types) do
				--if t != player then
                    if mget(i, j) == t.spr then
                        create(t, i * 8, j * 8)
                    end
                --end
			end
		end
	end
end

function draw_char_ship()
    map(119, 0, 119*8, 0, 9, 9)
end