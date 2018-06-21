function love.load()
  image = love.graphics.newImage("media/jump_3.png")

  frames = {}
  local frame_width = 117
  local frame_height = 233
  local source_width = image:getWidth()
  local source_height = image:getHeight()

  local maxFrames = 5 -- we only have 5 frames to handle as quads
  for i = 0, 1 do -- loop through the rows we have
    for j = 0, 2 do -- loop throught the columns we have
      table.insert(frames, love.graphics.newQuad(1 + j * (frame_width + 2), 1 + i * (frame_height + 2), frame_width, frame_height, source_width, source_height))
      if #frames == maxFrames then
        break
      end
    end
  end

  currentFrame = 1
end

function love.update(dt)
  currentFrame = currentFrame + 10 * dt
  if currentFrame >= 6 then
    currentFrame = 1
  end
end

function love.draw()
  love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100)
end