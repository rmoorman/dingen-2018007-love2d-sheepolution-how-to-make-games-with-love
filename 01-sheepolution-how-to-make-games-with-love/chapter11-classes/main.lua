Object = require("classic")
require("shape")
require("circle")
require("rectangle")

function love.load()  
  r1 = Rectangle(100, 100, 200, 50)
  r2 = Rectangle(180, 300, 25, 140)
  r3 = Circle(180, 300, 50)
end

function love.update(dt)
  r1:update(dt)
  r2:update(dt)
  r3:update(dt)
end

function love.draw()
  r1:draw()
  r2:draw()
  r3:draw()
end
