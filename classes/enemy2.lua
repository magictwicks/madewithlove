s = require("settings")
GameObject = require("classes/base/game_object")
Enemy2 = GameObject:new()

function Enemy2:load()
    self._name = "enemy2"
    self.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy2.png")
    self.x = math.random(0, 100)
    self.y = 0
    self.speed = s.enemySpeed / 3
end

function Enemy2:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

return Enemy2