function love.load()
  fruits = {"apple", "banana"}
  table.insert(fruits, "pear")
end

function love.update()
end

function love.draw()
  for k, v in pairs(fruits) do
    love.graphics.print(v, 100, k * 100)
  end
end
