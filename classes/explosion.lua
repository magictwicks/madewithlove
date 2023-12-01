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
    instance.currentFrame = -1
    instance.frameCounter = 0
    instance.frameLength = 8
    return instance
end

function Explosion:update(dt)

end

function Explosion:draw()
    self:nextFrame()
    if self.sprites then
        love.graphics.draw(self.sprites[self.currentFrame], self.x, self.y)
    end
end

function Explosion:nextFrame()
    self.frameCounter = self.frameCounter + 1
    if self.currentFrame == -1 then
        self.currentFrame = 1
    end
    if self.currentFrame == 4 and self.frameCounter >= self.frameLength then
        self:destroy()
    end
    
    if self.frameCounter >= self.frameLength then
        if self.currentFrame < 4 then
            self.currentFrame = self.currentFrame + 1
        end
        self.frameCounter = 1 
    end
end


function Explosion:destroy()
    self.scene:remove(self)
end


return Explosion