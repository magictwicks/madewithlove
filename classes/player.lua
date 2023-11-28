s = require("settings")

-- Player "inherits" from the GameObject class
GameObject = require("classes/base/game_object")
Player = GameObject:new()

-- defines the class variables for the player object (might need to reevaluate structure)
function Player:load()
    self._name = "player"
    self.sprites = {
        left = love.graphics.newImage("/Assets/Sprites/Player/left.png"),
        right = love.graphics.newImage("/Assets/Sprites/Player/right.png"),
        default = love.graphics.newImage("/Assets/Sprites/Player/default.png")
    }
    self.sprite = self.sprites.default
    self.x = 50
    self.y = 120
    self.speed = s.playerSpeed
end 

-- draw method for Player class
function Player:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
end

function Player:setSprite(spr)
    self.sprite = self.sprites[spr]
end 

return Player