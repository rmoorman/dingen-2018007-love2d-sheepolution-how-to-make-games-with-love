function love.load()
  tile_image = love.graphics.newImage("media/tile.png")
  tile_width = tile_image:getWidth()
  tile_height = tile_image:getHeight()
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
        love.graphics.draw(tile_image, tile_index * tile_width, row_index * tile_height)
      end
    end
  end
end
