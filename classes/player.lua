s = require("settings")

-- Player "inherits" from the GameObject class
Entity = require("classes/base/entity")
Player = Entity:new()

-- defines the class variables for the player object (might need to reevaluate structure)
function Player:new(scene, reset)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    
    instance.name = "player"
    instance.scene = scene
    instance.sprites = {
        left = love.graphics.newImage("/Assets/Sprites/Player/left.png"),
        right = love.graphics.newImage("/Assets/Sprites/Player/right.png"),
        default = love.graphics.newImage("/Assets/Sprites/Player/default.png")
    }
    instance.sprite = instance.sprites.default
    instance.x = 64
    instance.y = 168

    instance.timeToShoot = .2
    instance.timer = instance.timeToShoot

    instance.speed = s.playerSpeed
    instance.health = s.playerHealth

    instance.onDeath = reset

    return instance 
end 

-- draw method for Player class
function Player:draw() 
    love.graphics.draw(self.sprite, self.x, self.y)
    if s.showColliders then 
        love.graphics.rectangle("line", self.x, self.y, self.colSize, self.colSize)
        love.graphics.points(self.x + (self.colSize / 2), self.y + (self.colSize / 2))
    end
    for i = 1, self.health, 1  do
        love.graphics.draw(self.sprites.default, 10 * i - 6, s.gameHeight - 10)
    end
end

function Player:setSprite(spr)
    self.sprite = self.sprites[spr]
end 

function Player:onCollisionEnter(entity)
    if entity:getName() ~= "projectile"  then
        entity:destroy()
        self.health = self.health - 1
        if self.health <= 0 then
            print("Player died")
            local scores = io.open("scoredata.txt", "a")
            if scores then
                scores:write(self.scene.score .. "\n")
                scores:close()
            end

            local highscore = io.open("highscore.txt", "r+")
            if highscore then
                local high = tonumber(highscore:read("*a")) 
                if self.scene.score > high then
                    highscore:seek("set", 0)
                    highscore:write(self.scene.score)
                end
                highscore:close()
            end

            self.onDeath()
        end
    end
end

function Player:reset()
    self.health = s.playerHealth
    self.x = 64
    self.y = 168
end

return Player