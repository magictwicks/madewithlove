local Settings = {}

Settings.speedScalar = 1

Settings.gameWidth = 128
Settings.gameHeight = 224
Settings.scale = 4

Settings.playerSpeed = 75
Settings.projectileSpeed = 150 * Settings.speedScalar
Settings.orbSpeed = 100 * Settings.speedScalar

Settings.playerHealth = 5

Settings.spawnInterval = 5
Settings.difficultyInterval = 20

Settings.borgSpeed = 20 * Settings.speedScalar
Settings.borgHealth = 3
Settings.borgScore = 25

Settings.shooterSpeed = 12 * Settings.speedScalar
Settings.shooterHealth = 2
Settings.shooterScore = 50

Settings.showColliders = false
Settings.showObjects = false



Settings.score = {
    ["Borg"] = 25, 
    ["Shooter"] = 50
}

function Settings.difficultyScale()
    Settings.shooterSpeed = Settings.shooterSpeed * 1.1
    Settings.borgSpeed = Settings.borgSpeed * 1.1
    Settings.orbSpeed = Settings.orbSpeed * 1.1
    Settings.projectileSpeed = Settings.projectileSpeed * 1.1
end

function Settings.loadGraphics()
    customFont = love.graphics.newFont(12)
    love.graphics.setFont(customFont)
end

-- returns a canvas to be used for debugging 
function Settings.createCanvas()
    return love.graphics.newCanvas()
end

return Settings