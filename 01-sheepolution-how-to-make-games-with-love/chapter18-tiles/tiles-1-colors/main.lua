function love.load()
  tilemap = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
    {1, 2, 3, 4, 5, 5, 4, 3, 2, 1},
    {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  }
  colors = {
    [1] = {255, 255, 255},
    [2] = {255, 0,   0  },
    [3] = {255, 0,   255},
    [4] = {0,   0,   255},
    [5] = {0,   255, 255},
  }
end

function love.draw()
  for row_index, row in ipairs(tilemap) do
    for tile_index, tile in ipairs(row) do
      if tile > 0 then
        love.graphics.setColor(colors[tile])
        love.graphics.rectangle("fill", tile_index * 25, row_index * 25, 25, 25)
      end
    end
  end
  
  -- or
  -- for i = 1, #tilemap do
  --   for j = 1, #tilemap[i] do
  --     if tilemap[i][j] == 1 then
  --       love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
  --     end
  --   end
  -- end
end
