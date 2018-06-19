Player = Object:extend()

function Player:new()
  self.image = love.graphics.newImage("media/panda.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = love.graphics.getWidth() / 2 - self.width / 2
  self.y = 20
  self.speed = 500
end

function Player:keypressed(key)
  if key == "space" then
    self:fireBullet()
  end
end

function Player:fireBullet()
  local x = self.x + self.width / 2
  local y = self.y + self.height / 2
  fireBullet(x, y)
end

function Player:update(dt)
  if love.keyboard.isDown("left") then
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.isDown("right") then
    self.x = self.x + self.speed * dt
  end

  local window_width = love.graphics.getWidth()

  if self.x < 0 then
    self.x = 0
  end
  if self.x + self.width > window_width then
    self.x = window_width - self.width
  end
end

function Player:draw()
  love.graphics.draw(self.image, self.x, self.y)
end
