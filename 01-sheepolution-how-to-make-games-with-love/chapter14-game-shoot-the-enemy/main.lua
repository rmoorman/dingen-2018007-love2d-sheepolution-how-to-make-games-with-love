Object = require("classic")
require("player")
require("enemy")
require("bullet")

function love.load()
  player = Player()
  enemy = Enemy()
  bulletList = {}
end

function love.keypressed(key)
  player:keypressed(key)
end

function love.update(dt)
  player:update(dt)
  enemy:update(dt)

  for i, bullet in ipairs(bulletList) do
    bullet:update(dt)
    if bullet:checkCollision(enemy) then
      enemy.speed = speedup(enemy.speed, 50)
      table.remove(bulletList, i)
    end
    if bullet:checkOffScreen() then
      love.load()
    end
  end
end

function love.draw()
  player:draw()
  enemy:draw()

  for i, bullet in ipairs(bulletList) do
    bullet:draw()
  end
end

function fireBullet(x, y)
  table.insert(bulletList, Bullet(x, y))
end

function speedup(speed, amount)
  if speed < 0 then
    return speed - amount
  else
    return speed + amount
  end
end
