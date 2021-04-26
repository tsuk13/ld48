red_planet = new_type(10)

station = new_type(9)
function station.init(self)
    self.planet_name = "LSL-113"
    self.dialogue = {
        "test",
        "1,2,3",
    }
end

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