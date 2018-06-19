function love.load()
  image = love.graphics.newImage("media/sheep.png")
  sheep_rotation = 0
end

function love.update(dt)
  sheep_rotation = sheep_rotation + 2 * dt
end

function love.draw()
  love.graphics.setBackgroundColor(255, 255, 255)
  love.graphics.draw(image, 300, 300, sheep_rotation, 2, 2, image:getWidth()/2, image:getHeight()/2)
end

