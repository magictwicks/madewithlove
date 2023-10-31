local GameObject = {}

function GameObject:new() 
    local instance = {} -- sets type if passed in 
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


-- self explanatory
function GameObject:isGameObject()
    return true
end 


return GameObject