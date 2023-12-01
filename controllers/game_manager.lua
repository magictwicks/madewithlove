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





return GameManager