local GameObject = {}

function GameObject:new() 
    local instance = {_name="game_object"} -- sets type if passed in 
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
    self._sID = id
end 

-- getter for sID
function GameObject:getID()
    return self._sID
end

function GameObject:name()
    return self._name
end

return GameObject