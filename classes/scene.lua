-- Scene Class 
local Scene = {}

-- creates and returns a new instance of a scnene
function Scene:new(objects)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    instance._objects = objects or {} -- empty if no parameter is passed
    instance._size = 0
    instance._counter = 1 -- used to generate sID values
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

-- loops over all of the objects and invokes their update method 
function Scene:update(dt)
    for key, object in pairs(self._objects) do 
        object:update(dt)
    end
end

-- takes in a class that inherits from 'GameObject' and adds it to the scene
function Scene:add(o)
    if o:isGameObject() then 
        -- first increments the size and counter
        self._size = self._size + 1
        self._counter = self._counter + 1

        -- adds to the Scenes objects at the string value of counter
        self._objects[tostring(self._counter)] = o
        o:setID(tostring(self._counter))
    end
    self:debug()
end

function Scene:remove(o)
    if o:isGameObject() then
        table.remove(self._objects, o:getID())
    end
    self._size = self._size - 1
    self:debug()
end

function Scene:debug(canvas)
    -- love.graphics.setCanvas(canvas) -- load canvas
    local sceneList = {}
    for key, object in pairs(self._objects) do 
        sceneList[object:name()] = (sceneList[object:name()] or 0) + 1
    end
    local lineCount = 1
    for key, val in pairs(sceneList) do 
        love.graphics.print(key .. tostring(val), 10, 10*lineCount)
        lineCount = lineCount + 1
    end
    -- love.graphics.setCanvas() -- unload canvas
end 


return Scene
