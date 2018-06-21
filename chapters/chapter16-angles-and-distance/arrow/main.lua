function love.load()
  arrow = {
    x = 200,
    y = 200,
    speed = 300,
    angle = 0,
    image = love.graphics.newImage("media/arrow_right.png")
  }
  arrow.origin_x = arrow.image:getWidth() / 2
  arrow.origin_y = arrow.image:getHeight() / 2
end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  
  arrow.angle = math.atan2(mouse_y - arrow.y, mouse_x - arrow.x)
  
  local cos = math.cos(arrow.angle)
  local sin = math.sin(arrow.angle)
  
  arrow.x = arrow.x + arrow.speed * cos * dt
  arrow.y = arrow.y + arrow.speed * sin * dt
end

function love.draw()
  love.graphics.draw(arrow.image, arrow.x, arrow.y, arrow.angle, 1, 1, arrow.origin_x, arrow.origin_y)
  love.graphics.circle("fill", mouse_x, mouse_y, 5)
end
