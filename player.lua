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
    self.can_warp = false
    self.is_warping = false
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.update(self)
    if self.is_warping then
        if self.angle != self.target_warp_heading then
            self.angle = (self.angle + self.turn_spd) % 360
        else
            --calculate movement vector
            local mov_vec = {}
            mov_vec.x = -sin(self.angle/360)
            mov_vec.y = -cos(self.angle/360)

            --add vector to velocity

            self.velocity.x = approach(self.velocity.x, mov_vec.x*3, .3)
            self.velocity.y = approach(self.velocity.y, mov_vec.y*3, .3)

            --decrement warp timer
            self.warp_timer -= 1
            _starfield.warp = 2
        end
        if self.warp_timer <= 0 then
            objects = { self }
            --load level
            load_sector(self.target_sector)
            load_sector(ship_ob)
            self.x = current_sector.x*8
            self.y = current_sector.y*8
            --calculate movement vector
            local mov_vec = {}
            mov_vec.x = -sin(self.angle/360)
            mov_vec.y = -cos(self.angle/360)
            self.velocity.x = mov_vec.x
            self.velocity.y = mov_vec.y
            self.is_warping = false
        end
        --apply movement
        self:move_x(self.velocity.x)
        self:move_y(self.velocity.y)
        self.ship_x = self.x
        self.ship_y = self.y

    else
        -- check can warp
        self.can_warp = not(
            self.x + self.hit_x + self.hit_w > current_sector.x*8 and
            self.y + self.hit_y + self.hit_h > current_sector.y*8 and
            self.x + self.hit_x < current_sector.x*8 + current_sector.w*8 and
            self.y + self.hit_y < current_sector.y*8 + current_sector.h*8
        )
        --ship updates
        if not self.is_char then 
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
            if input_b_pressed > 0 then
                consume_b_press()
                self:start_warp(sectors.home.s_warp[1])
            end

            --apply movement
            self:move_x(self.velocity.x)
            self:move_y(self.velocity.y)
            self.ship_x = self.x
            self.ship_y = self.y

            
            --input a
            if input_a_pressed > 0 then
                consume_a_press()
                self:switch_to_char()
            end
        else
            --character updates
            self:move_x(input_x)
            self:move_y(input_y)
            self.char_x = self.x
            self.char_y = self.y
            for o in all(objects) do
                if o.base == ship_helm then
                    self.can_use_ship_helm = true
                else
                    self.can_use_ship_helm = false
                end
            end
            if input_a_pressed > 0 and self.can_use_ship_helm then
                consume_a_press()
                self:switch_to_ship()
            end
        end
        _starfield.warp = 1
    end
    --update camera
    

    camera_x = self.x - 60
    camera_y = self.y - 60
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

function player.switch_to_ship(self)
    self.is_char = false
    self.spr = 1
    self.x = self.ship_x
    self.y = self.ship_y
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.start_warp(self, sector)
    self.is_warping = true
    self.target_sector = sectors[sector.sector_name]
    self.target_warp_heading = sector.heading
    self.warp_timer = 100
end