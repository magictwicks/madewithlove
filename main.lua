-- Utilities
local s = require("settings")
local push = require("push") -- courtesy of Ulydev on GitHub
-- Classes 
local Player = require("classes/player")
local Scene = require("classes/scene")

local PlayerController = require("controllers/player_controller")
local Projectile = require("classes/projectile")

local Enemy = require("classes/enemy")
local EnemyController = require("controllers/enemy_controller")

local Explosion = require("classes/explosion")

-- setup for push
local gameWidth, gameHeight = 224, 256 -- fixed virtual game resolution
local windowWidth, windowHeight = love.window.getDesktopDimensions()
windowWidth, windowHeight = gameWidth*4, gameHeight*4


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
    myPlayer = Player:new()
    myEnemy = Enemy:new()

    -- add them to the scene
    myScene:add(myPlayer)
    myScene:add(myEnemy)

    -- loads all of the objects in the scene
    myScene:load()
end

function love.draw()
    push:start()
    
    myScene:draw() -- renders all of the objects in the scene 
    myScene:debug(debugCanvas) -- prints list of elements in the scene
    
    push:finish()
end

function love.update(dt)
    PlayerController.run(myScene, myPlayer, dt)
    EnemyController.run(myScene, myEnemy, myPlayer, dt)
    myScene:update(dt)
    -- myScene:flush()
end

-- callback function if any key is pressed
function love.keypressed(key, scancode, isrepeat) 
    if key == 'space' then 
        PlayerController.shoot(myScene, myPlayer)
    end
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
end