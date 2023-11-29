-- The GameObjects class is the abstract base class from which almost all on screen objects should inherit
-- The GameObject
local GameObject = {}

function GameObject:new() 
    local instance = {
        name="game_object", 
        active = true, 
        x = 0,
        y = 0
    }
    setmetatable(instance, self)
    self.__index = self
    return instance
end

-- abstract method 
function GameObject:draw()
    error("'draw' method must be implemented")
end 

-- abstract method 
function GameObject:load()
    error("'load' method must be implemented")
end

-- maybe eventually have it so it returns the sID which will allow scene to store updatable objects separately. 
function GameObject:update()
    -- implement me :)
end

-- self explanatory
function GameObject:isGameObject()
    return true
end 

-- sets the GameObjects sID; 
-- the instances sID is used by the Scene class to add and remove GameObjects
function GameObject:setID(id)
    self.sID = id
end 

-- getter for sID
function GameObject:getID()
    return self.sID
end

-- getter for _name
function GameObject:getName()
    return self.name
end

-- getter for isActive
function GameObject:isActive()
    return self.active
end

-- setter for isActive
function GameObject:setActive(bool)
    self.active = bool
end

function GameObject:collides()
    return false
end

function GameObject:canCollide()
    return false
end

return GameObject