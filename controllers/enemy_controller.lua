EnemyProjectile = require("classes/enemy_projectile")

local EnemyController = {}

function EnemyController.run(scene, enemy, player, dt)
    -- Define parameters for the repeating pattern
    local xSpacing = 100
    local ySpacing = 20
    local maxY = 160
    -- Update the enemy's position based on the pattern
    if enemy.x < xSpacing then
        -- Move right
        enemy.x = enemy.x + (enemy.speed * dt) / 5
        enemy.y = enemy.y + (enemy.speed * dt) / 5
    else
        enemy.x = enemy.x - (enemy.speed * dt) / 5
        enemy.y = enemy.y + (enemy.speed * dt) / 5
    end

    if player.x - enemy.x > 1 or player.x - enemy.x < -1 then
        local proj = EnemyProjectile:new()
        proj:load(scene, enemy.x, enemy.y)
        scene:add(proj)
    end
end

return EnemyController
    