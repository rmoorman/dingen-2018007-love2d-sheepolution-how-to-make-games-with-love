function love.load()
  fruits = {"apple", "banana"}
  table.insert(fruits, "pear")
  table.insert(fruits, "pineapple")
  table.remove(fruits, 2)
  fruits[1] = "tomato"
end

function love.update()
end

function love.draw()
  for i = 1, #fruits do
    love.graphics.print(fruits[i], 100, 100 + 50 * i)
  end
end
