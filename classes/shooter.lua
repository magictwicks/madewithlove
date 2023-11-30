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

    instance.timeToShoot = 1
    instance.stopwatch = instance.timeToShoot
    instance.canShoot = true

    return instance
end

function Shooter:update(dt)
    self.stopwatch = math.max(0, self.stopwatch - dt)

    if (self.x > 0 and self.x < s.gameWidth and self.y > 0 and self.y < s.gameHeight and self.stopwatch == 0) then
        canShoot = true
    else 
        canShoot = false
    end

    self.y = self.y + (self.speed * dt)
    
    if canShoot then
        local proj = EnemyProjectile:new(self.scene, self.x + 4, self.y + 8)
        self.scene:add(proj)
        self.stopwatch = self.timeToShoot
    end
end

return Shooter