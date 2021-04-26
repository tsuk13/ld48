objects = {}
types = {}
lookup = {}
function lookup.__index(self, i) return self.base[i] end

object = {}
object.speed_x = 0
object.speed_y = 0
object.remainder_x = 0
object.remainder_y = 0
object.hit_x = 0
object.hit_y = 0
object.hit_w = 8
object.hit_h = 8
object.facing = 1
object.hazard = 0
object.vulnerable = false
object.stompable = false
object.health = 1

function object.update()
end

function object.draw(self)
    spr(self.spr, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
end

function object.move_x(self, x, on_collide)
    self.remainder_x += x
    local mx = flr(self.remainder_x + .5)
    self.remainder_x -= mx

    local total = mx
    local mxs = sgn(mx)
    while(mx != 0)
    do
        if self:check_solid(mxs, 0) then
            if on_collide then
                return on_collide(self, total - mx, total)
            end
            return true
        else
            self.x += mxs
            mx -= mxs
        end
    end

    return false
end

function object.move_y(self, y, on_collide)
    self.remainder_y += y
    local my = flr(self.remainder_y + .5)
    self.remainder_y -= my

    local total = my
    local mys = sgn(my)
    while(my != 0)
    do
        if self:check_solid(0, mys) then
            if on_collide then
                return on_collide(self, total - my, total)
            end
            return true
        else
            self.y += mys
            my -= mys
        end
    end

    return false
end

function object.overlaps(self, b, ox, oy)
	if self == b then return false end
	ox = ox or 0
	oy = oy or 0
	return
		ox + self.x + self.hit_x + self.hit_w > b.x + b.hit_x and
		oy + self.y + self.hit_y + self.hit_h > b.y + b.hit_y and
		ox + self.x + self.hit_x < b.x + b.hit_x + b.hit_w and
		oy + self.y + self.hit_y < b.y + b.hit_y + b.hit_h
end

function object.contains(self, px, py)
	return
		px >= self.x + self.hit_x and
		px < self.x + self.hit_x + self.hit_w and
		py >= self.y + self.hit_y and
		py < self.y + self.hit_y + self.hit_h
end

function object.check_solid(self, ox, oy)
    ox = ox or 0
    oy = oy or 0

	-- for i = flr((ox + self.x + self.hit_x) / 8),flr((ox + self.x + self.hit_x + self.hit_w - 1) / 8) do
	-- 	for j = oy + self.y + self.hit_y,oy + self.y + self.hit_y + self.hit_h - 1 do
	-- 		if fget(mget(i, j), 1) then
	-- 			return true
    --         end
	-- 	end
	-- end

	for o in all(objects) do
		if o.solid and o != self and not o.destroyed and self:overlaps(o, ox, oy) then
			return true
		end
	end

	return false
end

function object.on_damage(self, amount)
    if not amount then amount = 1 end
    if self.vulnerable then self.health -= amount end
end

function object.on_collide_x(self, moved, target)
	self.remainder_x = 0
	self.speed_x = 0
	return true
end

function object.on_collide_y(self, moved, target)
	self.remainder_y = 0
	self.speed_y = 0
	return true
end

function create(type, x, y)
    local obj = {}
    obj.base = type
    obj.x = x
    obj.y = y
    obj.id = flr(x/8) + flr(y/8) * 128
    setmetatable(obj, lookup)
    add(objects, obj)
    if obj.init then obj.init(obj) end
    return obj
end

function new_type(spr)
    local obj = {}
    obj.spr = spr
    obj.base = object
    setmetatable(obj, lookup)
    add(types, obj)
    return obj
end