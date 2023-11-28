-- an Entity inherits from the GameObject class. It belongs within a Scene's Kosmos and provides functionality 
-- for detecting interactions (also known as collisions) beween GameObjects
GameObject = require("/classes/base/game_object")

Entity = GameObject:new()

function Entity:new()
    local instance = {name="Entity"} -- sets type if passed in 
    setmetatable(instance, self)
    self.__index = self
    -- instance variables
    instance.colSize = 8 -- the size of the collider... always square for now
    return instance
end

function Entity:collides(entity)
    -- half distance of collider
    local thisHalfDist = self.colSize / 2
    local otherHalfDist = entity:getColSize() / 2

    -- calculate the distance between center points
    local dx = math.abs((self.x + thisHalfDist) - (entity.x + otherHalfDist))
    local dy = math.abs((self.y + thisHalfDist) - (entity.y + otherHalfDist))

    -- calculate minimum x and y distance
    local m = thisHalfDist + otherHalfDist

    return dx < m and dy < m
end

-- called when an entity begins colliding; must be implemented by any Entity class
function Entity:onCollisionEnter(entity)
    error("onCollisionEnter method needs to be implemented")
end

function Entity:destroy()
    error("destroy method needs to be implemented")
end

function Entity:getColSize() 
    return self.colSize
end

return Entity

