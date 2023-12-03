Borg = require("classes/borg")
Shooter = require("classes/shooter")

local GameManager = {}

GameManager.spawnInterval = 5 -- in seconds

function GameManager:init(scene, start)
    self.scene = scene
    self.startTime = start 
    self.timeToSpawn = GameManager.spawnInterval
end

function GameManager:update(dt)
    self.currTime = love.timer.getTime() - self.startTime -- time in seconds
    print(self.currTime)
    self.timeToSpawn = self.timeToSpawn - love.timer.getDelta() -- subtracting the time between the last two frames (in seconds)
    
    if self.timeToSpawn <= 0 then
        self.timeToSpawn = GameManager.spawnInterval
        GameManager.spawnWave(self.scene)
    end
end

function GameManager.spawnWave(scene)
    borgTriangle(scene, 0)
    shooterEnemy(scene, math.random(100), 0)
    orbEnemy(scene, math.random(100), 0)
    doubleOrbShooter(scene, 32)
end

function borgTriangle(scene, yoffset) 
    offset = math.random(-32, 32)
    b = Borg:new({scene=scene, x = s.gameWidth / 2 + offset, y = 0 + yoffset})
    scene:add(b)
    for i = 1, 4, 1 do 
        b1 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*i + offset, y = i*-8 + yoffset, })
        b2 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*i + offset, y = i*-8 + yoffset, })
        scene:add(b1)
        scene:add(b2)
    end 
end

function shooterEnemy(scene, x, y)
    shooter = Shooter:new({scene=scene, x = x, y = y, speed = 20})
    scene:add(shooter)
    for i = 1, math.random(3), 1 do
        shooter1 = Shooter:new({scene=scene, x = math.random(s.gameWidth), y = y, })
        scene:add(shooter1)
    end
end

function orbEnemy(scene, x, y)
    orb = Shooter:new({scene = scene, x = x, y = y, speed = 20, isOrb = true})
    scene:add(orb)
end 

function doubleOrbShooter(scene, yoffset)
    s1 = Shooter:new({ scene = myScene, player = myPlayer, x = (s.gameWidth / 2) - 24, y = 0 - yoffset, isOrb=true})
    s2 = Shooter:new({ scene = myScene, player = myPlayer, x = (s.gameWidth / 2) + 24, y = 0 - yoffset, isOrb=true})
    scene:add(s1)
    scene:add(s2)
end


-- so there are 3 types of enemies at the moment... borgs, shooters, and orb shooters
-- the borgs just travel straight down the screen
-- the shooters shoot at a set interval and shoot a singular purple projectile
-- shooters can also be created with the isOrb boolean set to true... this makes them orb shooters
-- orb shooters shoot three orbs at a set interval... the three orbs burst and have a slight spread effect
-- i think the best thing to do would be creating a lot of different patterns for enemies to spawn in!


return GameManager