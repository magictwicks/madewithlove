s = require("settings")

Entity = require("classes/base/entity")
EnemyProjectile = Entity:new()

function EnemyProjectile:new(scene, x, y, n)
    local instance = {} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.name = n or "enemy_projectile"
    instance.scene = scene
    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy_projectile.png")
    
    -- movement related
    instance.x = x
    instance.y = y
    instance.speed = s.projectileSpeed
    return instance
end 

-- draw method for Player class
function EnemyProjectile:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
    
    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
    end
end

-- update method for EnemyProjectile class
function EnemyProjectile:update(dt)
    self.y = self.y + (self.speed * dt)
    
    -- destroy the projectile if it leaves the screen
    -- TODO: fix this cuz it no worky
    if (self.y > s.gameHeight and self.isActive) then
        self:destroy()
    end
end

function EnemyProjectile:onCollisionEnter(entity)
    if entity:getName() == "enemy" and self.name == "projectile" then
        entity:destroy()
        self:destroy()
    end
end

function EnemyProjectile:destroy()
    self.scene:remove(self)
end

return EnemyProjectile