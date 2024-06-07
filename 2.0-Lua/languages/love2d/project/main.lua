local message = require('message')

local posX     = love.graphics.getWidth()
local posY     = love.graphics.getHeight()
local Keyboard = love.keyboard

function love.load()
   love.mouse.setVisible(false)
end


function love.update(dt)
   if Keyboard.isDown('w') or Keyboard.isDown('up') then
      posY = posY - 230 * dt
   end

   if Keyboard.isDown('s') or Keyboard.isDown('down') then
      posY = posY + 230 * dt
   end

   if Keyboard.isDown('d') or Keyboard.isDown('right') then
      posX = posX + 230 * dt
   end

   if Keyboard.isDown('a') or Keyboard.isDown('left') then
      posX = posX - 230 * dt
   end
end


function love.draw()
   love.graphics.print(message.hello, posX / 2, posY / 2)
end
