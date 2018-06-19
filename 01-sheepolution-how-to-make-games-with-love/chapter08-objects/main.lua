function love.load()
  listOfRectangles = {}
end

function createRectangle()
  rect = {}
  rect.x = 100
  rect.y = 100
  rect.width = 70
  rect.height = 90
  rect.speed = 100
  return rect
end

function love.keypressed(key)
  if key == "space" then
    table.insert(listOfRectangles, createRectangle())
  end
end

function love.update(dt)
  for i, rect in ipairs(listOfRectangles) do
    rect.x = rect.x + rect.speed * dt
  end
end

function love.draw()
  for i, rect in ipairs(listOfRectangles) do
    love.graphics.rectangle("line", rect.x, rect.y , rect.width, rect.height)
  end
end

