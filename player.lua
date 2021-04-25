player = new_type(1)
player.max_spd = 1
player.turn_spd = 10
player.acc = {x=0, y=0}
player.velocity = {x=0, y=0}

function player.init(self)
    self.hit_x = 4
    self.hit_y = 1
    self.hit_w = 2
    self.hit_h = 6
    self.angle = 0
    self.ship_x = self.x
    self.ship_y = self.y
    self.char_x = 123*8
    self.char_y = 2*8
    self.is_char = false
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.update(self)
    if input_x !=0 then
        self.angle = (self.angle + input_x * self.turn_spd) % 360
    end
    --accel
    if input_y < 0 then
        --calculate movement vector
        local mov_vec = {}
        mov_vec.x = -sin(self.angle/360)
        mov_vec.y = -cos(self.angle/360)

        --add vector to velocity

        self.velocity.x = approach(self.velocity.x, mov_vec.x, .1)
        self.velocity.y = approach(self.velocity.y, mov_vec.y, .1)
    --stop
    elseif input_y > 0 then
        self.velocity.x = approach(self.velocity.x, 0, .1)
        self.velocity.y = approach(self.velocity.y, 0, .1)
    end

    --input a
    if input_a_pressed > 0 then
        consume_a_press()
        self:switch_to_char()
    end
    --apply movement
    self:move_x(self.velocity.x)
    self:move_y(self.velocity.y)
    --update camera
    

    camera_x = approach(camera_x, self.x - 60, 1)
    camera_y = approach(camera_y, self.y - 60, 1)
    camera(camera_x, camera_y)
    --update stars
    _starfield.star_dir.x = -self.velocity.x
    _starfield.star_dir.y = -self.velocity.y
    _starfield.star_spd = 1
end

function player.draw(self)
    if self.is_char then
        spr(32, self.x, self.y, 1, 1)
    else
        spr_r(self.spr,self.x,self.y,self.angle,1,1)
    end
end

function player.switch_to_char(self)
    self.is_char = true
    self.spr = 32
    self.x = self.char_x
    self.y = self.char_y
    camera_x = self.x - 60
    camera_y = self.y - 60
end