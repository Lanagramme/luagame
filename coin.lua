require("entity")
local love = love

math.randomseed(os.time())

Coin = {}
function Coin:new()
  local coin = Entity:new(50, 50)
  coin.x = math.random(0, 800-coin.w)
  coin.y = math.random(0, 600-coin.h)
  return coin
end

Coins = {}
function Coins:load()
  if math.random() < 0.03 then
    local coin = Coin:new()
    table.insert(Coins, coin)
  end

  for i=#Coins, 1, -1 do
    local coin = Coins[i]
    if AABB(Player.x, Player.y, Player.w, Player.h, coin.x, coin.y, coin.w, coin.h) then
      table.remove(Coins, i)
      Score = Score +1
    end
  end
end

function Coins:draw(color)
  love.graphics.setColor(0, 0, 0)
  for i=1, #Coins, 1 do
    local coin = Coins[i]
    love.graphics.rectangle('fill', coin.x, coin.y, coin.w, coin.h)
  end
  love.graphics.setColor(unpack(color))
end
