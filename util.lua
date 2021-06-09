-- approach curve used for acceleration and movement
function approach(x, target, max_delta)
    if x < target then
        return min(x + max_delta, target)
    else
        return max(x - max_delta, target)
    end
end

function spr_r(s,x,y,a,w,h)
    sw=(w or 1)*8
    sh=(h or 1)*8
    sx=(s%8)*8
    sy=flr(s/8)*8
    x0=flr(0.5*sw)
    y0=flr(0.5*sh)
    a=a/360
    sa=sin(a)
    ca=cos(a)
    for ix=0,sw-1 do
        for iy=0,sh-1 do
            dx=ix-x0
            dy=iy-y0
            xx=flr(dx*ca-dy*sa+x0)
            yy=flr(dx*sa+dy*ca+y0)
            if (xx>=0 and xx<sw and yy>=0 and yy<=sh) then
                local c = sget(sx+xx,sy+yy)
                if(c~=0 and xx < sw and yy < sh) then pset(x+ix,y+iy,sget(sx+xx,sy+yy)) end
            end
        end
    end
end
   

-- gets the tile at the given location from the loaded level
function tile_at(x, y)
	if (x < 0 or y < 0 or x >= level.map_width or y >= level.map_height) then return 0 end

	if standalone then
		return mget(x, y)
	else
		return peek(0x4300 + x + y * level.map_width)
	end
end

-- modified map
function draw_map()
	for x = mid(0, flr(camera_x / 8), level.width),mid(0, flr((camera_x + 128) / 8), level.width) do
		for y = mid(0, flr(camera_y / 8), level.height),mid(0, flr((camera_y + 128) / 8), level.height) do
			local tile = tile_at(x, y)
			if level.pal and fget(tile, 7) then level.pal() end
			if tile != 0 and fget(tile, 0) then spr(tile, x * 8, y * 8) end
			pal() palt()
		end
	end
end

function print_center(text, x, y, c)
	x -= (#text * 4 - 1) / 2
	print(text, x, y, c)
end

function animate_basic_spr(spr_n, x, y, flip_x, flip_y, alt)
    --grab and move foot pixel and render a line higher
    if alt then
        local lf_off = {
            x=2,
            y=7,
        }
        local rf_off = {
            x=5,
            y=7,
        }
        local lf_bg_c = pget(x + lf_off.x, y + lf_off.y - 1)
        local rf_bg_c = pget(x + rf_off.x, y + rf_off.y - 1)
        spr(spr_n, x, y-1, 1, 1, flip_x, flip_y)
        local lf_c = pget(x + lf_off.x, y + lf_off.y - 1)
        local rf_c = pget(x + rf_off.x, y + rf_off.y - 1)
        pset(x + lf_off.x, y + lf_off.y - 1, lf_bg_c)
        pset(x + rf_off.x, y + rf_off.y - 1, rf_bg_c)
        pset(x + lf_off.x-1, y + lf_off.y - 1, lf_c)
        pset(x + rf_off.x+1, y + rf_off.y - 1, rf_c)
    else
        --normal sprite
        spr(spr_n, x, y, 1, 1, flip_x, flip_y)
    end
end
   