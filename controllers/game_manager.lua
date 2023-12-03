Borg = require("classes/borg")
Shooter = require("classes/shooter")

local GameManager = {}

GameManager.spawnInterval = 10 -- in seconds

function GameManager:init(scene, start)
    self.scene = scene
    self.startTime = start * 1000000
    self.timeToSpawn = GameManager.spawnInterval
end

function GameManager:update(dt)
    self.currTime = love.timer.getTime() * 1000000 - self.startTime -- time in seconds
    self.timeToSpawn = self.timeToSpawn - love.timer.getDelta() -- subtracting the time between the last two frames (in seconds)
    
    if self.timeToSpawn <= 0 then
        self.timeToSpawn = GameManager.spawnInterval
        GameManager.spawnWave(self.scene)
    end
end

function GameManager.spawnWave(scene)
    borgTriangle(scene, 0)
    doubleOrbShooter(scene, 32)
end

function borgTriangle(scene, yoffset) 
    b = Borg:new({scene=scene, x = s.gameWidth / 2, y = 0 + yoffset})
    scene:add(b)
    for i = 1, 6, 1 do 
        b1 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*i, y = i*-8 + yoffset, })
        b2 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*i, y = i*-8 + yoffset, })
        scene:add(b1)
        scene:add(b2)
    end 
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