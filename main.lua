-- Utilities
local s = require("settings")
local push = require("push") -- courtesy of Ulydev on GitHub
-- Classes 
local Player = require("classes/player")
local Scene = require("classes/scene")

local PlayerController = require("controllers/player_controller")

local Borg = require("classes/borg")
local Shooter = require("classes/shooter")
-- setup for push
local gameWidth, gameHeight = s.gameWidth, s.gameHeight -- fixed virtual game resolution
local windowWidth, windowHeight = gameWidth*4, gameHeight*4


function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, 
        {
            pixelperfect=false
        })

    s.loadGraphics()
    debugCanvas = s.createCanvas()

    -- instantiate objects
    myScene = Scene:new({ collides=true })
    myPlayer = Player:new(myScene)
    myEnemy = Borg:new({ scene = myScene, x = 100, y = 0, speed = 20})

    myEnemy2 = Shooter:new({ scene = myScene, player = myPlayer, x = 150, y = 0, speed = 20})
    -- add them to the scene
    myScene:add(myPlayer)
    myScene:add(myEnemy)
    myScene:add(myEnemy2)

    -- loads all of the objects in the scene
    -- myScene:load()
end

function love.draw()
    push:start()
    
    myScene:draw() -- renders all of the objects in the scene 
    myScene:debug(debugCanvas) -- prints list of elements in the scene
    
    push:finish()
end

function love.update(dt)
    PlayerController.run(myScene, myPlayer, dt)
    -- EnemyController.run(myScene, myEnemy, myPlayer, dt)
    myScene:update(dt)
    -- myScene:flush()
end

-- callback function if any key is pressed
function love.keypressed(key, scancode, isrepeat) 
    -- DEBUG: Print all objects in the Scene
    if key == 'p' then
        myScene:printObjs()
    end
    -- DEBUG: Print Global Table
    if key == 'g' then
        for key, value in pairs(_G) do
            print(key, value)
        end
    end

    if key == 'c' then
        s.showColliders = not s.showColliders
    end
end