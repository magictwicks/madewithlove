GameObject = require('/classes/base/game_object')

local Explosion = GameObject:new()

function Explosion:load(scene, x, y)
    self.x = x
    self.y = y
    self.sprites = {}
    self.sprites[1] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_0.png")
    self.sprites[2] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_1.png")
    self.sprites[3] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_2.png")
    self.sprites[4] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_3.png") 
end

function Explosion:update(dt)

end

function Explosion:draw()
    print(self.x)
    love.graphics.draw(self.sprites[math.floor((love.timer.getTime()*8)%4)+1], self.x, self.y)
end

return Explosion