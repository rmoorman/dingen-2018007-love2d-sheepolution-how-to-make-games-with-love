function love.load()
  x = 100
  move = true
end

function love.update(dt)
  if x > 500 then
    move = false
  end

  if move then
    x = x + 100 * dt
  end
end

function love.draw()
  love.graphics.rectangle("line", x, 50, 200, 150)
end
