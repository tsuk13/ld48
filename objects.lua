--planets/stations
lsl_113 = new_type(9)
function lsl_113.init(self)
    self.planet_name = "lsl-113"
    self.dialogue = {
        "lsl-113 is one of 256 manned stations that left your dying home world to seek somewhere hospitable in the depths of space.",
        "the ftl drive has malfunctioned and needs replacement as well as a refuel",
        "of the 2,000 lives on board, you are the only one woken from cryo sleep.",
        "you must seek out a planet with a fuel source and find your sister station to take their backup ftl engine core",
    }
    self.map = {
        x=0,
        y=0,
        w=16,
        h=16,
        stairs = {
            x=8,
            y=14,
        },
    }
end

red_headed = new_type(10)
function red_headed.init(self)
    self.planet_name = "red headed"
    self.dialogue = {
        "this gas giant glows faintly orange and red due to ammonia crystals and ice that form in its clouds",
    }
end

red_handed = new_type(11)
function red_handed.init(self)
    self.planet_name = "red handed"
    self.dialogue = {
        "red iron oxide covers this planets surface making it appear red",
    }
end

kill_devils = new_type(12)
function kill_devils.init(self)
    self.planet_name = "kill devils"
    self.dialogue = {
        "the surface of kill devils appears to be covered in a silica sand that has been crushed to a fine powder over billions of years",
        "dunes cover the planet resulting from the near constant wind storms",
        "these winds and dunes result in a world with ever-changing topography",
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
        "with an abundance of water, big blue appears to be covered in an unending ocean",
        "beneath its waves you wonder what lies in the depths."
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
        "this dying star emits massive flares that can damage electrical equipment like out ship.",
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
        "as you dock with the sister station lsl-112, you feel a sense of relief.",
        "the station automatically installs the needed ftl drive.",
        "as you release the coupling system you look back at the spinning wheels of the station and think about how fragile it looks as the distance grows.",
        "so many lives, loose, adrift in the void."
    }
end

asteroids = new_type(26)

the_pin = new_type(27)
function the_pin.init(self)
    self.planet_name = "the pin"
    self.dialogue = {
        "once a planet, a massive meteor has shattered it resulting in a dangerous band of asteroids.",
    }
end

moon = new_type(41)

deep_blue = new_type(42)
function deep_blue.init(self)
    self.planet_name = "deep blue"
    self.dialogue = {
        "not all that different in look from your home planet, deep blue may contain the fuel you need.",
        "you scan its surface and find a deposit on one of the larger landmasses",
        "you dispatch a drone that is able to retrieve the necessary amount of fuel need to restart the ftl drives reaction",
    }
end

love = new_type(43)
function love.init(self)
    self.planet_name = "love"
    self.dialogue = {
        "named so for the abstracted shape of a heart, you find yourself thinking of someone back in a cryo pod on your station...",
    }
end

lust = new_type(44)
function lust.init(self)
    self.planet_name = "lust"
    self.dialogue = {
        "the deeper red of this twin heart burns hotter",
    }
end

thought = new_type(46)
function thought.init(self)
    self.planet_name = "thought"
    self.dialogue = {
        "a strange looking planet that bring to your mind, home",
    }
end

action = new_type(47)
function action.init(self)
    self.planet_name = "action"
    self.dialogue = {
        "a strange looking planet that for some reason feels you with the resolve that you will finish this mission and return home.",
    }
end

--ship objects
ship_floor = new_type(65)
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

--dynamic
fuel = new_type(80)
function fuel.draw(self)
    if p.visited_the_deep == true then 
        spr(self.spr, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    else
        spr(65, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    end
end
ftl = new_type(81)
function ftl.draw(self)
    if p.visited_lsl_112 == true then 
        spr(self.spr, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    else
        spr(65, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    end
end
hull_breach = new_type(82)
function hull_breach.draw(self)
    if p.hull_breach == true then 
        spr(self.spr, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    else
        spr(65, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    end
end
breaker = new_type(83)
function breaker.draw(self)
    if p.breaker_flipped == true then 
        spr(self.spr, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    else
        spr(65, self.x, self.y, 1, 1, self.flip_x, self.flip_y)
    end
end

--stairs
ship_stairs = new_type(97)
function ship_stairs.draw(self)
    spr(65, self.x,self.y,1,1,self.flip_x, self.flip_y)
    if(p.landed == true) then
        spr(self.spr,self.x,self.y,1,1,self.flip_x, self.flip_y)
    end
end
planet_stairs = new_type(96)