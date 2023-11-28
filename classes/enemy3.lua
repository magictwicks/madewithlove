s = require("settings")
GameObject = require("classes/base/game_object")
Enemy3 = GameObject:new()

function Enemy3:load()
    self._name = "enemy3"
    self.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy3.png")
    self.x =  math.random(0, 100)
    self.y = 0
    self.speed = s.enemySpeed / 2
end

function Enemy2:draw()
    love.graphics.draw(self.sprite, self.x, self.y)
end

return Enemy3