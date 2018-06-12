function love.load()
  fruits = {"apple", "banana"}
  table.insert(fruits, "pear")
end

function love.update()
end

function love.draw()
  for i = 1, #fruits do
    love.graphics.print(fruits[i], 100, i * 100)
  end
end
