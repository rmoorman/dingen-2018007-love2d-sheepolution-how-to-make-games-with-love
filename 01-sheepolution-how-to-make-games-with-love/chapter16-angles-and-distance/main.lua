function love.load()
  circle = {
    x = 100,
    y = 100,
    radius = 25,
    speed = 200,
  }
  attraction_distance = 400
end

function love.update(dt)
  mouse_x, mouse_y = love.mouse.getPosition()
  y_distance = mouse_y - circle.y
  x_distance = mouse_x - circle.x
  
  angle = math.atan2(y_distance, x_distance)
  
  cos = math.cos(angle)
  sin = math.sin(angle)
  
  local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  
  if distance > 0.6 and distance < attraction_distance then
    local adjusted_speed
    if distance > attraction_distance / 2 then
      adjusted_speed = circle.speed * ((attraction_distance - distance) / 100)
    else
      adjusted_speed = circle.speed * (distance / 100)
    end
    
    circle.x = circle.x + adjusted_speed * cos * dt
    circle.y = circle.y + adjusted_speed * sin * dt
  end

end

function love.draw()
  local mydistance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.print(mydistance / 100)
  love.graphics.circle("line", circle.x, circle.y, circle.radius)
  love.graphics.line(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.line(circle.x, circle.y, mouse_x, circle.y)
  --love.graphics.line(circle.x, circle.y, circle.x, mouse_y)
  love.graphics.line(mouse_x, mouse_y, mouse_x, circle.y)
  
  local distance = getDistance(circle.x, circle.y, mouse_x, mouse_y)
  love.graphics.circle("line", circle.x, circle.y, distance)
end


function getDistance(x1, y1, x2, y2)
  local h = x1 - x2
  local v = y1 - y2

  local a = h ^ 2
  local b = v ^ 2
  
  local c = a + b
  local distance = math.sqrt(c)
  return distance
end
