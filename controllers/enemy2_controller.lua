local Enemy2Controller = {}
function Enemy2Controller.run(scene, enemy, dt)
    enemy.y = enemy.y + (enemy.speed * dt) / 5
end

return Enemy2Controller