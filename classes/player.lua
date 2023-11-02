s = require("settings")

-- Player "inherits" from the GameObject class
GameObject = require("classes/base/game_object")
Player = GameObject:new()

-- defines the class variables for the player object (might need to reevaluate structure)
function Player:load()
    self._name = "player"
    self.sprite = love.graphics.newImage("/Assets/Sprites/player.png")
    self.sprite:setFilter('nearest', 'nearest') -- removes pixel blur 
    self.x = 0
    self.y = 0
    self.speed = s.playerSpeed
end 

-- draw method for Player class
function Player:draw() 
    love.graphics.draw(self.sprite, self.x, self.y, 0, s.scale)
end


return Player