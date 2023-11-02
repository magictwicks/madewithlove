local Player = require("classes/player")
local Scene = require("classes/scene")
local PlayerController = require("controllers/player_controller")
local Projectile = require("classes/projectile")
local s = require("settings")

function love.load()
    s.loadGraphics()
    debugCanvas = s.createCanvas()
    -- instantiate objects
    myPlayer = Player:new()
    myScene = Scene:new()
    -- add them to the scene
    myScene:add(myPlayer)
    -- loads all of the objects in the scene
    myScene:load()
end

function love.draw()
    myScene:draw() -- renders all of the objects in the scene 
    myScene:debug(debugCanvas) -- prints list of elements in the scene
end

function love.update(dt)
    PlayerController.run(myScene, myPlayer, dt)
    myScene:update(dt)
end

-- callback function if any key is pressed
function love.keypressed(key, scancode, isrepeat) 
    if key == 'space' then 
        PlayerController.shoot(myScene, myPlayer)
    end
end


