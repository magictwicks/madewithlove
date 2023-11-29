Enemy = require("classes/enemy")
EnemyProjectile = require("classes/enemy_projectile")
Shooter = Enemy:new()

function Shooter:new(args)
    local instance = {name="Shooter"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy2.png")
    instance.scene = args.scene
    instance.player = args.player
    instance.x = args.x or 0
    instance.y = args.y or 0
    instance.speed = args.speed or 0

    instance.xSpacing = args.xSpacing or 100
    instance.ySpacing = args.ySpacing or 20
    instance.maxY = args.maxY or 160

    return instance
end

function Shooter:update(dt)
    -- Update the enemy's position based on the pattern
    if self.x < self.xSpacing then
        -- Move right
        self.x = self.x + (self.speed * dt) 
        self.y = self.y + (self.speed * dt) 
    else
        self.x = self.x - (self.speed * dt)
        self.y = self.y + (self.speed * dt)
    end

    if self.player.x - self.x > 1 or self.player.x - self.x < -1 then
        local proj = EnemyProjectile:new(self.scene, self.x, self.y)
        self.scene:add(proj)
    end
end

return Shooter