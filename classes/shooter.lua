Enemy = require("classes/enemy")
EnemyProjectile = require("classes/enemy_projectile")
OrbProjectile = require("classes/orb_projectile")
Shooter = Enemy:new()

function Shooter:new(args)
    local instance = {name="Shooter"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self

    instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy2.png")

    if args.isOrb then
        instance.sprite = love.graphics.newImage("Assets/Sprites/Enemy/enemy.png")
    end
    
    instance.scene = args.scene
    instance.player = args.player
    instance.x = args.x or 0
    instance.y = args.y or 0

    instance.speed = s.shooterSpeed 
    instance.health = s.shooterHealth
    
    instance.xSpacing = args.xSpacing or 100
    instance.ySpacing = args.ySpacing or 20
    instance.maxY = args.maxY or 160

    instance.timeToShoot = s.shootInterval
    instance.stopwatch = instance.timeToShoot
    instance.canShoot = true

    instance.isStrafe = args.isStrafe
    instance.isMovingLeft = false
    instance.isOrb = args.isOrb or false

    if instance.isOrb then
        instance.sprite = love.graphics.newImage("/Assets/Sprites/Enemy/enemy.png")
    end

    return instance
end

function Shooter:update(dt)
    self.stopwatch = math.max(0, self.stopwatch - dt)

    if self.isStrafe then 
        local strafeRange = 10
        
        if self.x >= s.gameWidth - strafeRange then
            self.isMovingLeft = true
        elseif self.x <= strafeRange then
            self.isMovingLeft = false
        end

        if self.isMovingLeft then
            self.x = self.x - (self.speed * dt)
        else
            self.x = self.x + (self.speed * dt)
        end
    end

    if (self.x > 0 and self.x < s.gameWidth and self.y > 0 and self.y < s.gameHeight and self.stopwatch == 0) then
        canShoot = true
    else 
        canShoot = false
    end

    self.y = self.y + (self.speed * dt)
    
    if canShoot and not self.isOrb then
        local proj = EnemyProjectile:new(self.scene, self.x + 4, self.y + 8)
        self.scene:add(proj)
        self.stopwatch = self.timeToShoot
    end

    if canShoot and self.isOrb then
        local orb = OrbProjectile:new(self.scene, self.x + 4, self.y + 8)
        self.scene:add(orb)
        local orb1 = OrbProjectile:new(self.scene, self.x + 4, self.y + 8, 1)
        self.scene:add(orb1)
        local orb2 = OrbProjectile:new(self.scene, self.x + 4, self.y + 8, -1)
        self.scene:add(orb2)
        self.stopwatch = self.timeToShoot
    end

    if self.y > s.gameHeight + 8 then
        self:destroy()
    end 
end

return Shooter