s = require("settings")

GameObject = require("classes/base/game_object")
Enemy = Entity:new()

function Enemy:load(scene)
    self._name = "enemy"
    self.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy.png")
    self.scene = scene
    -- print(self.scene)
    self.x = 50
    self.y = 0
    self.speed = s.enemySpeed
end

function Enemy:draw()
    love.graphics.draw(self.sprite, self.x, self.y)

    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
    end
end

function Enemy:onCollisionEnter(entity)
    if entity:getName() == "player" then
        self.scene:remove(self)
    end
end

return Enemy