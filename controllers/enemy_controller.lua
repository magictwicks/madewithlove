Projectile = require("classes/projectile")

local EnemyController = {}

function EnemyController.run(scene, enemy, player, dt)
    if player.x - enemy.x > 0 then
        enemy.x = enemy.x + (enemy.speed * dt) / 3
    elseif player.x - enemy.x < 0 then
        enemy.x = enemy.x - (enemy.speed * dt) / 3
    end

    if player.y - enemy.y > 0 then
        enemy.y = enemy.y + (enemy.speed * dt) / 4
    elseif player.y - enemy.y < 0 then
        enemy.y = enemy.y - (enemy.speed * dt) / 4
    end

    if player.x == enemy.x then
        local proj = Projectile:new()
        proj:load(scene, enemy.x, enemy.y, "enemy_projectile")
        scene:add(proj)
    end
end

return EnemyController
    