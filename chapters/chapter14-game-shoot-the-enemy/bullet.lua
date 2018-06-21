Bullet = Object:extend()

function Bullet:new(x, y)
  self.image = love.graphics.newImage("media/bullet.png")
  self.width = self.image:getWidth()
  self.height = self.image:getHeight()
  self.x = x - self.width / 2
  self.y = y
  self.speed = 700
end

function Bullet:update(dt)
  self.y = self.y + self.speed * dt
end

function Bullet:draw()
  love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:checkCollision(obj)
  local top = self.y
  local right = self.x + self.width
  local bottom = self.y + self.height
  local left = self.x
  
  local obj_top = obj.y
  local obj_right = obj.x + obj.width
  local obj_bottom = obj.y + obj.height
  local obj_left = obj.x
  
  return
    top < obj_bottom
    and right > obj_left
    and bottom > obj_top
    and left < obj_right
end

function Bullet:checkOffScreen()
  return self.y > love.graphics.getHeight()
end