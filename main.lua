require "collision"
require "input"
require "player"
require 'coin'
require "utils"
require 'assets'

local love = love

function love.load()
  Score= 0
  SetSprite(Player, Demo_sprite, 2, 0, 3, 1)

end

function love.update(dt)
  Coins:load()
  Input(Player)
  Animate(dt, Player, Player.direction)

end

function love.draw()
  local originalColor = {love.graphics.getColor()}

  love.graphics.setBackgroundColor(BetterColor(125, 150, 150))

  Coins:draw(originalColor)
  Player.draw()

  love.graphics.print("SCORE: " .. Score, 10, 10)
end
