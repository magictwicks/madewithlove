Enemy = require("classes/enemy")

Borg = Enemy:new()

function Borg:new(args)
    local instance = {name="Borg"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.colSize = 6
    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy3.png")
    instance.scene = args.scene
    instance.x = args.x or 0
    instance.y = args.y or 0
    instance.speed = args.speed or 0

    return instance
end

function Borg:update(dt)
    self.y = self.y + (self.speed * dt)
end

return Borg