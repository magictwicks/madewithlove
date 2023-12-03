s = require("settings")

Entity = require("classes/base/entity")
OrbProjectile = Entity:new()

function OrbProjectile:new(scene, x, y, d, n)
    local instance = {} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.name = n or "enemy_projectile"
    instance.scene = scene
    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/orb_projectile.png")
    
    -- movement related
    instance.x = x
    instance.y = y
    instance.speed = s.orbSpeed
    instance.xSpeed = 50
    instance.direction = d or nil
    return instance
end 

-- draw method for Player class
function OrbProjectile:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
    
    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
    end
end

-- update method for OrbProjectile class
function OrbProjectile:update(dt)
    self.y = self.y + (self.speed * dt)

    if self.direction then
        self.x = self.x + (self.direction * self.xSpeed * dt)
    end
    -- destroy the projectile if it leaves the screen
    -- TODO: fix this cuz it no worky
    if (self.y > s.gameHeight and self.isActive) then
        self:destroy()
    end
end

function OrbProjectile:onCollisionEnter(entity)
    if entity:getName() == "enemy" and self.name == "projectile" then
        entity:destroy()
        self:destroy()
    end
end

function OrbProjectile:destroy()
    self.scene:remove(self)
end

return OrbProjectile