local Player = require("player")
local Scene = require("scene")

function love.load()
    -- instantiate objects
    myPlayer = Player:new()
    myScene = Scene:new()
    -- add them to the scene
    myScene:add(myPlayer)
    
    -- loads all of the objects in the scene
    myScene:load()
end

function love.draw()
    myScene:draw()
end

