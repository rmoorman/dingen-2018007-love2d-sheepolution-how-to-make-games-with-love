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

  player = {
    image = love.graphics.newImage("media/player.png"),
    tile_x = 2,
    tile_y = 2,
  }

  dot = {
    image = love.graphics.newImage("media/kenney_sokobanpack.environment_05.png"),
    tile_x = 5,
    tile_y = 5,
    offset_x = -15,
    offset_y = -15,
  }

  dot_eaten = false
end

function love.keypressed(key)
  local x = player.tile_x
  local y = player.tile_y

  if key == "left" then
    x = x - 1
  elseif key == "right" then
    x = x + 1
  elseif key == "up" then
    y = y - 1
  elseif key == "down" then
    y = y + 1
  end

  if isTileEmpty(x, y) then
    player.tile_x = x
    player.tile_y = y
  end

  if dot.tile_x == x and dot.tile_y == y then
    dot_eaten = true
  end
end

function love.draw()
  for row_index, row in ipairs(tilemap) do
    for col_index, col in ipairs(row) do
      if col ~= 0 then
        love.graphics.draw(tileset, quads[col], col_index * tile_width, row_index * tile_height)
      end
    end
  end

  love.graphics.draw(player.image, player.tile_x * tile_width, player.tile_y * tile_height)

  if dot_eaten then
    love.graphics.print("dot eaten")
  else
    love.graphics.draw(dot.image, dot.tile_x * tile_width + dot.offset_x, dot.tile_y * tile_height + dot.offset_y)
  end
end

function isTileEmpty(x, y)
  return tilemap[y][x] == 0
end
