-- an Entity inherits from the GameObject class. It belongs within a Scene's Kosmos and provides functionality 
-- for detecting interactions (also known as collisions) beween GameObjects
GameObject = require("/classes/base/game_object")

Entity = GameObject:new()

function Entity:new()
    local instance = {name="Entity"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self
    -- instance variables
    instance.isColliding = {} -- table of all objects the entity is in collision with
    instance.colSize = 0 -- the size of the collider... always square for now
    return instance
end

function Entity:collides(entity)
    -- if self.x + 
end

-- called when an entity begins colliding; must be implemented by any Entity class
function Entity:onCollisionEnter(entity)
    error("onCollisionEnter method needs to be implemented")
end

-- called every frame an entity is still in collision
function Entity:onCollisionStay(entity)
    -- error("method needs to be implemented")
end

-- called when an entity exits collision
function Entity:onCollisionExit(entity)
    -- error("method needs to be implemented")
end

return Entity

