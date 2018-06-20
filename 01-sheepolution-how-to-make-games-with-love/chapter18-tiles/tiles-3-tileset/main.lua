function love.load()
  tileset = love.graphics.newImage("media/tileset.png")
  
  -- image dimensions for quads
  local tileset_width = tileset:getWidth()
  local tileset_height = tileset:getHeight()
  local tileset_cols = 3
  local tileset_rows = 2
  local tile_bleed = 1
  local tile_bleed_total = tile_bleed * 2
  
  tile_width = (tileset_width / tileset_cols) - tile_bleed_total
  tile_height = (tileset_height / tileset_rows) - tile_bleed_total
  
  quads = {}
  for i = 0, tileset_rows - 1 do
    for j = 0, tileset_cols - 1 do
      table.insert(quads, love.graphics.newQuad(
        tile_bleed + j * (tile_width + tile_bleed_total),
        tile_bleed + i * (tile_height + tile_bleed_total),
        tile_width, tile_height,
        tileset_width, tileset_height
      ))
    end
  end

  tilemap = {
    {1, 6, 6, 2, 1, 6, 6, 2},
    {3, 0, 0, 4, 5, 0, 0, 3},
    {3, 0, 0, 0, 0, 0, 0, 3},
    {4, 2, 0, 0, 0, 0, 1, 5},
    {1, 5, 0, 0, 0, 0, 4, 2},
    {3, 0, 0, 0, 0, 0, 0, 3},
    {3, 0, 0, 1, 2, 0, 0, 3},
    {4, 6, 6, 5, 4, 6, 6, 5},
  }
end

function love.draw()
  for row_index, row in ipairs(tilemap) do
    for col_index, col in ipairs(row) do
      if col ~= 0 then
        love.graphics.draw(tileset, quads[col], col_index * tile_width, row_index * tile_height)
      end
    end
  end
end
