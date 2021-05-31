function _init()
    dtb_init()
    start_game()
    --create(player, 0,0)
end
p = {}

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
    if show_title then
        print_center("untitled space game", 64, 32, 7)
        print_center("by tsuk", 64, 42, 12)
    end
    camera(camera_x, camera_y)
	for o in all(objects) do
		if o.base == player then p = o else o:draw() end
	end
	if p then p:draw() end
    camera()
    dtb_draw()
    camera(camera_x, camera_y)
    if game_end then
        cls()
        print_center("thanks for playing!", 64, 64, 7)
    end
end

function start_game()
    freeze_time = 1
    game_end = false
    show_title = true
    load_sector(current_sector)
    load_sector(ship_ob)
    p = create(player, 7*8, 7*8)
    _starfield:init_stars()
    dtb_quick_queue({
        "you are awoken from cryo sleep and quickly ushered onto a ship by the station ai.",
        "a blinking screen informs you that you need to find a fuel source and link up with your sister station lsl-112 for a replacement ftl drive.",
    }, hide_title)
end

function load_sector(sector)
    --create objects
    if sector.objects then
        for ob in all(sector.objects) do
            for t in all(types) do
                --if t != player then
                    if ob.spr == t.spr then
                        create(t, ob.x * 8, ob.y * 8)
                    end
                --end
            end
        end
    else
        --original
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
end


function freeze_game()
    freeze_time = 1
end

function unfreeze_game()
    freeze_time = 0
end

function end_game()
    game_end = true
end

function hide_title()
    show_title = false
    unfreeze_game()
end