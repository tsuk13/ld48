--planets/stations
lsl_113 = new_type(9)
function lsl_113.init(self)
    self.planet_name = "lsl-113"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

red_headed = new_type(10)
function red_headed.init(self)
    self.planet_name = "red headed"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

red_handed = new_type(11)
function red_handed.init(self)
    self.planet_name = "red handed"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

kill_devils = new_type(12)
function kill_devils.init(self)
    self.planet_name = "kill devils"
    self.dialogue = {
        "test",
        "1,2,3",
    }
    self.hit_w = 16
    self.hit_h = 16
end
function kill_devils.draw(self)
    spr(self.spr, self.x, self.y, 2, 2, self.flip_x, self.flip_y)
end

big_blue = new_type(14)
function big_blue.init(self)
    self.planet_name = "big blue"
    self.dialogue = {
        "test",
        "1,2,3",
    }
    self.hit_w = 16
    self.hit_h = 16
end
function big_blue.draw(self)
    spr(self.spr, self.x, self.y, 2, 2, self.flip_x, self.flip_y)
end

dying_light = new_type(5)
function dying_light.init(self)
    self.planet_name = "dying light"
    self.dialogue = {
        "test",
        "1,2,3",
    }
    self.hit_w = 24
    self.hit_h = 24
end
function dying_light.draw(self)
    spr(self.spr, self.x, self.y, 4, 4, self.flip_x, self.flip_y)
end

lsl_112 = new_type(25)
function lsl_112.init(self)
    self.planet_name = "lsl-112"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

asteroids = new_type(26)

the_pin = new_type(27)
function the_pin.init(self)
    self.planet_name = "the pin"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

moon = new_type(41)

deep_blue = new_type(42)
function deep_blue.init(self)
    self.planet_name = "deep blue"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

love = new_type(43)
function love.init(self)
    self.planet_name = "love"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

lust = new_type(44)
function lust.init(self)
    self.planet_name = "lust"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

thought = new_type(46)
function thought.init(self)
    self.planet_name = "thought"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

action = new_type(47)
function action.init(self)
    self.planet_name = "action"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

--ship objects
ship_wall = new_type(64)
function ship_wall.init(self)
    self.solid = true
end
ship_wall_1 = new_type(68)
function ship_wall_1.init(self)
    self.solid = true
end
ship_wall_2 = new_type(69)
function ship_wall_2.init(self)
    self.solid = true
end
ship_wall_3 = new_type(84)
function ship_wall_3.init(self)
    self.solid = true
end
ship_wall_4 = new_type(85)
function ship_wall_4.init(self)
    self.solid = true
end

ship_helm = new_type(66)
navigation_comp = new_type(67)