-- an Entity inherits from the GameObject class. It belongs within a Scene's Kosmos and provides functionality 
-- for detecting interactions (also known as collisions) beween GameObjects
GameObject = require("/classes/base/game_object")

Entity = GameObject:new()

function Entity:onCollision(entity)

end



