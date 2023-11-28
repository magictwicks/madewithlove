local Settings = {}

Settings.scale = 4
Settings.playerSpeed = 100
Settings.projectileSpeed = 250
Settings.enemySpeed = 120

function Settings.loadGraphics()
    customFont = love.graphics.newFont(12)
    love.graphics.setFont(customFont)
end

-- returns a canvas to be used for debugging 
function Settings.createCanvas()
    return love.graphics.newCanvas()
end

return Settings