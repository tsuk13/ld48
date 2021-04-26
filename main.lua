function _init()
    start_game()
    dtb_init()
    --create(player, 0,0)
end

function _update()
    dtb_update()
    if freeze_time == 0 then
        update_input()
        _starfield:update_stars()
        for o in all(objects) do
            if o.base == player then p = o else o:update() end
        end
        p:update()
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
    camera()
    dtb_draw()
    camera(camera_x, camera_y)
end

function start_game()
    freeze_time = 0
    load_sector(current_sector)
    load_sector(ship_ob)
    create(player, 7*8, 7*8)
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
    map(112, 0, 112*8, 0, 16, 16)
end

function freeze_game()
    freeze_time = 1
end

function unfreeze_game()
    freeze_time = 0
end