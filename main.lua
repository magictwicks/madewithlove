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
    myPlayer = Player:new(myScene)
    
    -- add them to the scene
    myScene:add(myPlayer)
    -- myScene:add(myEnemy2)
    -- GameManager.spawnWave(myScene)
    GameManager:init(myScene, love.timer.getTime())

    -- loads all of the objects in the scene
    -- myScene:load()
end

function love.draw()
    push:start()

    
    
    if gameStart then 
        myScene:draw() -- renders all of the objects in the scene 
        if s.showObjects then
            myScene:debug(debugCanvas) -- prints list of elements in the scene
        end
    else
        if gamestate == 'title' then
            drawMainMenu()
        elseif gamestate == 'diffculty' then
            drawDiffMenu()
        end
    end

    push:finish()
end

function love.update(dt)
    if gameStart then
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
end

gamestate = "title"
local Menu = {}
​
function loadMenu()
    Menu.title = love.graphics.newImage('Sprites/USS_Title.png')
    Menu.start = love.graphics.newImage('Sprites/USS_Start_button.png')
    Menu.easy = love.graphics.newImage('Sprites/USS_Easy_button.png')
    Menu.medium = love.graphics.newImage('Sprites/USS_Medium_Button.png')
    Menu.hard = love.graphics.newImage('Sprites/USS_Hard_Button.png')
end
​
function drawMainMenu()
    love.graphics.draw(Menu.title, 317, 180)
    love.graphics.draw(Menu.start, 350, 290)
end
​
function drawDiffMenu()
    love.graphics.draw(Menu.easy, 350, 290)
    love.graphics.draw(Menu.medium, 350, 330)
    love.graphics.draw(Menu.hard, 350, 370)
end
​
function love.mousepressed (x,y,button)
    local x, y = love.mouse.getX(), love.mouse.getY()
    if button == 1 then
        if gamestate == "title" then
            -- start button collision
            if x > 350 and x < 350 + 88 and y > 290 and y < 290 + 23 then
                gamestate = "diffculty"
            end
        elseif gamestate == "diffculty" then
            -- easy, medium, hard button collision
            if x > 350 and x < 350 + 88 and y > 290 and y < 290 + 23 then
                gamestate = "playing_easy"
            elseif x > 350 and x < 350 + 88 and y > 330 and y < 330 + 23 then
                gamestate = "playing_medium"
            elseif x > 350 and x < 350 + 88 and y > 370 and y < 370 + 23 then
                gamestate = "playing_hard"
            end
        end
    end
end