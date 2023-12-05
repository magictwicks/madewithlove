-- Utilities
local s = require("settings")
local push = require("push") -- courtesy of Ulydev on GitHub
-- Classes 
local Player = require("classes/player")
local Scene = require("classes/scene")

local PlayerController = require("controllers/player_controller")


-- setup for push
local gameWidth, gameHeight = s.gameWidth, s.gameHeight -- fixed virtual game resolution
local windowWidth, windowHeight = gameWidth*4, gameHeight*4

Menu = {}
gameStart = false

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, 
        {
            pixelperfect=false
        })

    s.loadGraphics()
    debugCanvas = s.createCanvas()

    -- instantiate objects
    GameManager = require("controllers/game_manager")
    myScene = Scene:new({ collides=true })
    myPlayer = Player:new(myScene, reset)
    
    -- add them to the scene
    myScene:add(myPlayer)
    -- myScene:add(myEnemy2)
    -- GameManager.spawnWave(myScene)
    GameManager:init(myScene, love.timer.getTime())
end

function love.draw()
    push:start()

    if myScene.gamestate == "game" then
        myScene:draw() -- renders all of the objects in the scene 
        if s.showObjects then
            myScene:debug(debugCanvas) -- prints list of elements in the scene
        end
    else
        if myScene.gamestate == "menu" then
            drawMainMenu()
        end
    end

    push:finish()
end

function love.update(dt)
    if myScene.gamestate == "game" then
        PlayerController.run(myScene, myPlayer, dt)
        myScene:update(dt)
        GameManager:update(dt)
    end
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
    if key == 'o' then
        s.showObjects = not s.showObjects
    end
    if key == 'space' and myScene.gamestate == "menu" then
        myScene.gamestate = "game"
    end
end

function drawMainMenu()
    thruster = {
        love.graphics.newImage('Assets/Sprites/Thruster/sprite_0.png'),
        love.graphics.newImage('Assets/Sprites/Thruster/sprite_1.png'),
        love.graphics.newImage('Assets/Sprites/Thruster/sprite_2.png'),
        love.graphics.newImage('Assets/Sprites/Thruster/sprite_3.png'),
    }
    love.graphics.draw(love.graphics.newImage('Assets/Sprites/USS_Title.png'), 10, 20, 0, .7)
    love.graphics.draw(love.graphics.newImage('Assets/Sprites/USS_Press_Space.png'), 18.4, 100 + math.sin(love.timer.getTime() * 5), 0, .8)
    love.graphics.draw(myPlayer.sprites.default, 50, 160, 0, 4)
    love.graphics.draw(thruster[((math.floor(love.timer.getTime()*8)) % 4) + 1], 62, 188, 0, 4)
end

function reset()
    myScene:reset()
    myPlayer:reset()
    GameManager:init(myScene, love.timer.getTime())
end