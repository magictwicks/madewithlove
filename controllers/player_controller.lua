Projectile = require("classes/projectile")

local PlayerController = {}

function PlayerController.run(scene, player, dt)
    if love.keyboard.isDown('d') then
        player.x = player.x + (player.speed * dt)
    elseif love.keyboard.isDown('a') then
        player.x = player.x - (player.speed * dt)
    end 

    if love.keyboard.isDown('w') then
        player.y = player.y - (player.speed * dt)
    elseif love.keyboard.isDown('s') then
        player.y = player.y + (player.speed * dt)
    end 

    if love.keyboard.isDown('space') then
        local proj = Projectile:new()
        proj:load(scene, player.x, player.y)
        scene:add(proj)
    end 

end

-- called by callback 'keypressed' in game loop
function PlayerController.shoot(scene, player)    
    local proj = Projectile:new()
    proj:load(scene, player.x, player.y)
    scene:add(proj)
end


return PlayerController