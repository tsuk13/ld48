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
    draw_char_ship()
	if p then p:draw() end
end

function start_game()
    load_objects()
    _starfield:init_stars()
end

function load_objects()
    --local level = {width=16, height=16}
    --create objects
	for i = 0,128 do
		for j = 0,15 do
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