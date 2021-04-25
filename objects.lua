red_planet = new_type(10)
station = new_type(9)

ship_wall = new_type(64)
function ship_wall.init(self)
    self.solid = true
end

ship_helm = new_type(66)