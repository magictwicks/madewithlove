s = require("settings")

GameObject = require("classes/base/game_object")
Enemy = GameObject:new()

function Enemy:load()
    self._name = "enemy"
    self.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy.png")
    self.x = 50
    self.y = 0
    self.speed = s.enemySpeed
end

function Enemy:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

return Enemy