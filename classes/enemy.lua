s = require("settings")

Entity = require("classes/base/entity")
Explosion = require("classes/explosion")

Enemy = Entity:new()

function Enemy:load(scene)
    self.name = "enemy"
    self.scene = scene
    self.sprite = love.graphics.newImage("/Assets/Sprites/enemy.png")
    self.x = 0
    self.y = 100
    self.speed = s.enemySpeed
end

function Enemy:draw()
    love.graphics.draw(self.sprite, self.x, self.y)

    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
    end
end

function Enemy:onCollisionEnter(entity)
    if entity:getName() == "projectile" then
        entity:destroy()
        self:destroy()
    end
end

function Enemy:destroy()
    e = Explosion:new(self.scene, self.x, self.y)
    self.scene:add(e)
    self.scene:remove(self)
end

return Enemy