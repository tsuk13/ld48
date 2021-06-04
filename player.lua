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
    self.char_x = 120*8
    self.char_y = 3*8
    self.is_char = false
    self.can_warp = false
    self.is_warping = false
    self.warp_data_index = -1
    self.warp_data = nil
    self.target_sector = nil
    self.can_switch_to_char = true
    self.can_fix = false
    self.target_planet = nil
    self.visited_the_deep = false
    self.visited_lsl_112 = false
    --hazards
    self.hull_breach = false
    self.breaker_flipped = false
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.update(self)
    p=self
    if self.is_warping then
        if self.angle != self.target_warp_heading then
            self.angle = (self.angle + 5) % 360
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
        --end warp
        if self.warp_timer <= 0 then
            objects = { self }
            --load level
            load_sector(self.target_sector)
            current_sector = self.target_sector
            --hazard?
            if current_sector == sectors.the_pins then
                self.hull_breach = true
            end
            if current_sector == sectors.dying_light then
                self.breaker_flipped = true
            end
            --calculate movement vector
            local mov_vec = {}
            mov_vec.x = -sin(self.angle/360)
            mov_vec.y = -cos(self.angle/360)
            self.x = (current_sector.x*8 + current_sector.w*4) - mov_vec.x * 64
            self.y = (current_sector.y*8 + current_sector.h*4) - mov_vec.y * 64
            self.velocity.x = mov_vec.x
            self.velocity.y = mov_vec.y
            self.is_warping = false
            self.warp_data_index = -1
            self.warp_data = nil
            self.target_sector = nil
        end
        --apply movement
        self:move_x(self.velocity.x)
        self:move_y(self.velocity.y)
        self.ship_x = self.x
        self.ship_y = self.y

    else
        -- check can warp
        self.can_warp = not (
            self.x >= current_sector.x*8 and
            self.x < current_sector.x*8 + current_sector.w*8 and
            self.y >= current_sector.y*8 and
            self.y < current_sector.y*8 + current_sector.h*8
        ) and self.target_sector and not self.hull_breach and not self.breaker_flipped
        --ship updates
        if not self.is_char then 
            if input_x !=0 and not self.breaker_flipped then
                self.angle = (self.angle + input_x * self.turn_spd) % 360
            end
            --accel
            if input_y < 0  and not self.breaker_flipped  then
                --calculate movement vector
                local mov_vec = {}
                mov_vec.x = -sin(self.angle/360)
                mov_vec.y = -cos(self.angle/360)

                --add vector to velocity

                self.velocity.x = approach(self.velocity.x, mov_vec.x, .1)
                self.velocity.y = approach(self.velocity.y, mov_vec.y, .1)
                --sfx(1, 0)
            --stop
            elseif input_y > 0 and not self.breaker_flipped then
                self.velocity.x = approach(self.velocity.x, 0, .1)
                self.velocity.y = approach(self.velocity.y, 0, .1)
                --sfx(-1, 0)
            else
                --sfx(-1, 0)
            end

            
            --input a
            if self.can_warp and input_b_pressed > 0 then
                consume_b_press()
                self:start_warp(self.warp_data)
            end

            --apply movement
            self:move_x(self.velocity.x)
            self:move_y(self.velocity.y)
            self.ship_x = self.x
            self.ship_y = self.y

            --ship inspection checks
            self.can_switch_to_char = true 
            self.target_planet = nil
            for o in all(objects) do
                if self:overlaps(o) then 
                    if o.planet_name then
                        self.can_switch_to_char = false
                        self.target_planet = o
                    end
                end
            end
            --input b
            if input_b_pressed > 0 and self.can_switch_to_char then
                consume_b_press()
                self:switch_to_char()
            end

            if input_b_pressed > 0 and self.target_planet then
                consume_b_press()
                self:land_planet(self.target_planet)
            end
        else
            --character updates
            self:move_x(input_x)
            self:move_y(input_y)
            self.char_x = self.x
            self.char_y = self.y
            --character inspection checks
            self.can_use_ship_helm = false
            self.can_use_navigation_comp = false
            self.can_fix = false
            for o in all(objects) do
                if self:overlaps(o) then 
                    if o.base == ship_helm then
                        self.can_use_ship_helm = true
                    elseif o.base == navigation_comp then
                        self.can_use_navigation_comp = true
                    elseif o.base == hull_breach and self.hull_breach then
                        self.can_fix = true
                    elseif o.base == breaker and self.breaker_flipped then
                        self.can_fix = true
                    end
                end
            end
            if input_a_pressed > 0 and self.can_use_ship_helm then
                consume_a_press()
                self:switch_to_ship()
            end
            if input_a_pressed > 0 and self.can_use_navigation_comp then
                consume_a_press()
                self:cycle_nav()
            end
            if input_a_pressed > 0 and self.can_fix then
                consume_a_press()
                self.hull_breach = false
                self.breaker_flipped = false
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
    --character draw
    if self.is_char then
        spr(32, self.x, self.y, 1, 1)
        if(p.target_sector) then
            camera()
            color(7)
            print("warp target:")
            print(p.target_sector.name)
            camera(camera_x, camera_y)
        end
    --ship draw
    else
        spr_r(self.spr,self.x,self.y,self.angle,1,1)
        if(p.can_warp and p.target_sector) then
            camera()
            color(7)
            print("press x to warp")
            print(p.target_sector.name)
            camera(camera_x, camera_y)
        elseif(p.target_planet) then
            camera()
            color(7)
            print("press x to land")
            print(p.target_planet.planet_name)
            camera(camera_x, camera_y)
        end
    end
    --hazard warning
    if self.hull_breach then
        color(8)
        camera()
        print("warning: hull breach")
        camera(camera_x, camera_y)
    end
    if self.breaker_flipped then
        color(8)
        camera()
        print("warning: elec breaker triggered")
        camera(camera_x, camera_y)
    end
    if self.can_fix then
        color(7)
        camera()
        print("press z to fix")
        camera(camera_x, camera_y)
    end

end

function player.switch_to_char(self)
    objects = {self}
    load_sector(ship_ob)
    self.is_char = true
    self.spr = 32
    self.x = self.char_x
    self.y = self.char_y
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.switch_to_ship(self)
    objects = {self}
    load_sector(current_sector)
    self.is_char = false
    self.spr = 1
    self.x = self.ship_x
    self.y = self.ship_y
    camera_x = self.x - 60
    camera_y = self.y - 60
end

function player.cycle_nav(self)
    if self.visited_the_deep and self.visited_lsl_112 then
        self.warp_data = 
        {
            sector_name = "lsl_113",
            heading = 270,
        }
        self.target_sector = sectors[self.warp_data.sector_name]
    else
        local warp_datas = current_sector.warp_datas
        self.warp_data_index = (self.warp_data_index + 1) % #warp_datas
        self.warp_data = warp_datas[self.warp_data_index + 1]
        self.target_sector = sectors[self.warp_data.sector_name]
    end
end

function player.start_warp(self, sector)
    self.is_warping = true
    self.target_warp_heading = self.warp_data.heading
    self.warp_timer = 100
end

function player.land_planet(self, planet)
    freeze_game()
    if planet.base == lsl_113 and self.visited_the_deep and self.visited_lsl_112 then
        --todo end game
        dtb_quick_queue({
            "as your ship docks back with lsl-113, you can finally begin to relax knowing your mission is complete.",
            "the station takes care of unloading and restarting the ftl drive reactions.",
            "you wonder down the hall to your pod and find yourself staring at your reflection in the glass.",
            "tHE eND",
        }, end_game)
    else
        dtb_quick_queue(planet.dialogue, unfreeze_game)
        if planet.base == deep_blue then
            self.visited_the_deep = true
        end
        if planet.base == lsl_112 then
            self.visited_lsl_112 = true
        end
    end
end