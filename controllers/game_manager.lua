Borg = require("classes/borg")
Shooter = require("classes/shooter")
Settings = require("settings")

local GameManager = {}

function GameManager:init(scene, start)
    self.scene = scene
    self.startTime = start 
    self.timeToSpawn = Settings.spawnInterval 
    self.timeToScale = Settings.difficultyInterval
end

function GameManager:update(dt)
    self.currTime = love.timer.getTime() - self.startTime -- time in seconds
    self.timeToSpawn = self.timeToSpawn - love.timer.getDelta() -- subtracting the time between the last two frames (in seconds)
    self.timeToScale = self.timeToScale - love.timer.getDelta()
    if self.timeToScale <= 0 then
        self.timeToScale = Settings.difficultyInterval
        Settings.difficultyScale()
    end
    if self.timeToSpawn <= 0 then
        self.timeToSpawn = Settings.spawnInterval
        GameManager.spawnWave(self.scene)
    end
end

function GameManager.spawnWave(scene)
    borgBrick(scene, 0)
    borgTriangle(scene, 0)

    -- orbEnemy(scene, math.random(100), 0)
    doubleOrbShooter(scene, 32)
end

function borgTriangle(scene, yoffset) 
    offset = math.random(-32, 32)
    b = Borg:new({scene=scene, x = s.gameWidth / 2 + offset, y = 0 + yoffset})
    scene:add(b)
    for i = 1, 5, 1 do 
        b1 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*i, y = i*-8 + yoffset, })
        b2 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*i, y = i*-8 + yoffset, })
        scene:add(b1)
        scene:add(b2)
    end 
end

function borgBrick(scene, yoffset)
    local shift = math.random(-32, 32)
    b1 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*2 + shift, y = 1*-8 + yoffset, })
    b2 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*2 + shift, y = 1*-8 + yoffset, })
    b3 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*2 + shift, y = 4*-8 + yoffset, })
    b4 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*2 + shift, y = 4*-8 + yoffset, })
    shooter = Shooter:new({scene=scene, x = s.gameWidth / 2 + shift, y = -16 + yoffset, isOrb = true})
    scene:add(b1)
    scene:add(b2)
    scene:add(b3)
    scene:add(b4)
    scene:add(shooter)
end

function strafeShooters(scene, yoffset, number)
    for i = 1, number, 1 do
        shooter = Shooter:new({scene=scene, x = math.random(s.gameWidth), y = 0 - yoffset, isOrb = false, isStrafe = true})
        scene:add(shooter)
    end
end

function orbShooters(scene, yoffset, number)
    for i = 1, number, 1 do
        shooter = Shooter:new({scene=scene, x = math.random(s.gameWidth), y = 0 - yoffset, isOrb = true})
        scene:add(shooter)
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