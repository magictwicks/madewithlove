-- Player "inherits" from the GameObject class
GameObject = require("game_object")
Player = GameObject:new()

-- defines the class variables for the player object (might need to reevaluate structure)
function Player:load()
    self.sprite = love.graphics.newImage("/Assets/Sprites/Spaceship.png")
    self.x = 50
    self.y = 50
end 

-- draw method for Player class
function Player:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
end

return Player