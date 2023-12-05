s = require("settings")

Entity = require("classes/base/entity")
Explosion = require("classes/explosion")

Enemy = Entity:new()

function Enemy:new(scene)
    local instance = {name="Enemy"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance._name = "enemy"
    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy.png")
    instance.scene = scene
    instance.x = 50
    instance.y = 0

    return instance
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
        self.health = self.health - 1
        if self.health <= 0 then
            self:destroy(true)
        end
    end
end

function Enemy:destroy(byPlayer)
    e = Explosion:new(self.scene, self.x, self.y)
    self.scene:add(e)
    self.scene:remove(self)
    if byPlayer then
        self.scene:updateScore(s.score[self:getName()])
    end
end

return Enemy