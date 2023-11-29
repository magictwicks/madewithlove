GameObject = require('/classes/base/game_object')

local Explosion = GameObject:new()

function Explosion:new(scene, x, y)
    local instance = {name="Explosion"}
    setmetatable(instance, self)
    self.__index = self
    
    -- instance variables
    instance.scene = scene
    instance.x = x
    instance.y = y
    
    -- for animation
    instance.finished = false
    instance.sprites = {
        [1] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_0.png"),
        [2] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_1.png"),
        [3] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_2.png"),
        [4] = love.graphics.newImage("/Assets/Sprites/explosion_orange/sprite_3.png") 
    }
    return instance
end

function Explosion:update(dt)

end

function Explosion:draw()
    if self.finished then
        self:destroy()
    end

    local index = math.floor((love.timer.getTime()*8) % 4)+1

    love.graphics.draw(self.sprites[index], self.x, self.y)
    
    if index == 4 then
        self.finished = true
    end

end

function Explosion:destroy()
    self.scene:remove(self)
end


return Explosion