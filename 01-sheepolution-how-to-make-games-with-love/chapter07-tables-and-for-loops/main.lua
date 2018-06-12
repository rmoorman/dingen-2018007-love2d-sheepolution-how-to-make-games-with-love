function love.load()
  fruits = {"apple", "banana"}
  table.insert(fruits, "pear")
end

function love.update()
end

function love.draw()
  love.graphics.print(fruits[1], 100, 100)
end
