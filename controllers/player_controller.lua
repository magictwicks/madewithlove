Projectile = require("classes/projectile")

local PlayerController = {}

PlayerController.spaceKeyDown = false

function PlayerController.run(scene, player, dt)
    if love.keyboard.isDown('d') and player.x < s.gameWidth - 8 then
        player.x = player.x + (player.speed * dt)
        player.sprite = player.sprites.right
    elseif love.keyboard.isDown('a') and player.x > 0 then
        player.x = player.x - (player.speed * dt)
        player.sprite = player.sprites.left
    else 
        player.sprite = player.sprites.default
    end 

    if love.keyboard.isDown('w') and player.y > 0 then
        player.y = player.y - (player.speed * dt)
    elseif love.keyboard.isDown('s') and player.y < s.gameHeight - 8 then
        player.y = player.y + (player.speed * dt)
    end 

    if love.keyboard.isDown('space') and player.timer <= 0 then
        local proj = Projectile:new(scene, player.x, player.y)
        scene:add(proj)
        player.timer = player.timeToShoot
    end

    player.timer = player.timer - love.timer.getDelta()
end

return PlayerController