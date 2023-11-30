local Settings = {}

Settings.gameWidth = 224
Settings.gameHeight = 256
Settings.scale = 4
Settings.playerSpeed = 100
Settings.projectileSpeed = 250
Settings.enemySpeed = 60

Settings.showColliders = false

function Settings.loadGraphics()
    customFont = love.graphics.newFont(12)
    love.graphics.setFont(customFont)
end

-- returns a canvas to be used for debugging 
function Settings.createCanvas()
    return love.graphics.newCanvas()
end

return Settings