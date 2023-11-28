s = require("settings")

-- Player "inherits" from the GameObject class
Entity = require("classes/base/entity")
Player = Entity:new()

-- defines the class variables for the player object (might need to reevaluate structure)
function Player:load(scene)
    self.name = "player"
    self.scene = scene
    self.sprites = {
        left = love.graphics.newImage("/Assets/Sprites/Player/left.png"),
        right = love.graphics.newImage("/Assets/Sprites/Player/right.png"),
        default = love.graphics.newImage("/Assets/Sprites/Player/default.png")
    }
    self.sprite = self.sprites.default
    self.x = 0
    self.y = 0
    self.speed = s.playerSpeed
end 

-- draw method for Player class
function Player:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
        love.graphics.points(self.x + (self.colSize / 2), self.y + (self.colSize / 2))
    end
end

function Player:setSprite(spr)
    self.sprite = self.sprites[spr]
end 

function Player:onCollisionEnter(entity)
    
end

return Player