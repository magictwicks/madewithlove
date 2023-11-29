s =  require("settings")

GameObject = require("classes/base/game_object")
EnemyProjectile = GameObject:new()

function EnemyProjectile:load(scene, x, y)
    self._name = "projectile"
    self.scene = scene
    self.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy_projectile.png")
    self.x = x
    self.y = y
    self.speed = s.projectileSpeed / 3
end

function EnemyProjectile:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

function EnemyProjectile:update(dt)
    self.y = self.y + (self.speed * dt) / 2

    if (self.y < 0 and self.isActive) then
        self:setActive(false)
        self.scene:remove(self)
    end
end

return EnemyProjectile
