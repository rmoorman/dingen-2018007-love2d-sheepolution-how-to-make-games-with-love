function love.load()
  x = 100
end

function love.update(dt)
  if x < 700 then
    x = x + 100 * dt
  end
end

function love.draw()
  love.graphics.rectangle("line", x, 50, 200, 150)
end
