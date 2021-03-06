Enemy = Object:extend()

function Enemy:new()
  self.image = love.graphics.newImage("media/snake.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = 325
  self.y = 450
  self.speed = 100
end

function Enemy:update(dt)
  self.x = self.x + self.speed * dt
  
  local window_with = love.graphics.getWidth()
  
  if self.x < 0 then
    self.x = 0
    self.speed = -self.speed
  elseif self.x + self.width > window_with then
    self.x = window_with - self.width
    self.speed = -self.speed
  end
end

function Enemy:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
