-- @class Kosmos 

local Kosmos = {}

function Kosmos:new(entities)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    instance.objects = objects or {}
    return instance
end

function Kosmos:add(entity)
    self.objects[entity:getID()] = entity
end



return Kosmos