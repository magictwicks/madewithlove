Borg = require("classes/borg")

local GameManager = {}

function GameManager.spawnWave(scene)
    borgTriangle(scene, 0)
    borgTriangle(scene, 16)
    borgTriangle(scene, 32)
    borgTriangle(scene, 48)
    borgTriangle(scene, 64)
    borgTriangle(scene, 72)
end

function borgTriangle(scene, yoffset) 
    b = Borg:new({scene=scene, x = s.gameWidth / 2, y = 0 + yoffset, speed=20})
    scene:add(b)
    for i = 1, 6, 1 do 
        b1 = Borg:new({scene=scene, x = (s.gameWidth / 2) + 8*i, y = i*-8 + yoffset, speed=20})
        b2 = Borg:new({scene=scene, x = (s.gameWidth / 2) - 8*i, y = i*-8 + yoffset, speed=20})
        scene:add(b1)
        scene:add(b2)
    end 
end

-- so there are 3 types of enemies at the moment... borgs, shooters, and orb shooters
-- the borgs just travel straight down the screen
-- the shooters shoot at a set interval and shoot a singular purple projectile
-- shooters can also be created with the isOrb boolean set to true... this makes them orb shooters
-- orb shooters shoot three orbs at a set interval... the three orbs burst and have a slight spread effect
-- i think the best thing to do would be creating a lot of different patterns for enemies to spawn in!


return GameManager