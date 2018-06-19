Player = Object:extend()

function Player:new()
  self.image = love.graphics.newImage("media/panda.png")
end

function Player.update(dt)
end

function Player:draw()
  love.graphics.draw(self.image)
end
