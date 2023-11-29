s = require("settings")

Entity = require("classes/base/entity")
Projectile = Entity:new()

function Projectile:new(scene, x, y, n)
    local instance = {} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.name = name or "projectile"
    instance.scene = scene
    instance.sprite = love.graphics.newImage("/Assets/Sprites/projectile.png")
    
    -- movement related
    instance.x = x
    instance.y = y
    instance.speed = s.projectileSpeed
    return instance
end 

-- draw method for Player class
function Projectile:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
end

-- update method for Projectile class
function Projectile:update(dt)
    self.y = self.y - (self.speed * dt)
    
    -- destroy the projectile if it leaves the screen
    -- TODO: fix this cuz it no worky
    if (self.y < 0 and self.isActive) then
        self:setActive(false)
        self.scene:remove(self)
    end
end

function Projectile:onCollisionEnter(entity)
    if entity:getName() == "enemy" and self.name == "projectile" then
        entity:destroy()
        self:destroy()
    end
end

function Projectile:destroy()
    self.scene:remove(self)
end

return Projectile