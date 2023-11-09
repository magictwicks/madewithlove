s = require("settings")

GameObject = require("classes/base/game_object")
Projectile = GameObject:new()

function Projectile:load(scene, x, y)
    self._name = "projectile"
    self.scene = scene
    self.sprite = love.graphics.newImage("/Assets/Sprites/projectile.png")
    self.sprite:setFilter('nearest', 'nearest') -- removes pixel blur 
    
    -- movement related
    self.x = x
    self.y = y
    self.speed = s.projectileSpeed
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


return Projectile