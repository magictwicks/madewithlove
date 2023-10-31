-- Scene Class 
local Scene = {}

-- creates and returns a new instance of a scnene
function Scene:new(objects)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    instance._objects = objects or {} -- empty if no parameter is passed
    return instance
end

-- getter for a Scene's objects
function Scene:objects()
    return self._objects
end

function Scene:load()
    for key, object in pairs(self._objects) do 
        object:load()
    end
end

-- loops over all of the objects and invokes their draw method 
function Scene:draw()
    for key, object in pairs(self._objects) do 
        object:draw()
    end
end

-- takes in a class that inherits from 'GameObject' and adds it to the scene
function Scene:add(o)
    if o:isGameObject() then 
        table.insert(self._objects, o)
    end
end

return Scene
