-- Scene Class 
    local Scene = {}

-- creates and returns a new instance of a scnene
function Scene:new(args)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    instance.objects = args.objects or {} -- empty if no parameter is passed
    instance.collides = args.collides or false -- false by default
    instance._size = 0
    instance._counter = 0 -- used to generate sID values
    instance.score = 0
    return instance
end

-- getter for a Scene's objects
function Scene:objects()
    return self.objects
end

function Scene:load()
    print(self.objects)
    for _, object in pairs(self.objects) do 
        object:load(self)
    end
end

-- loops over all of the objects and invokes their draw method 
function Scene:draw()
    for _, object in pairs(self.objects) do 
        object:draw()
    end
    love.graphics.print("Score: " .. self.score, 0, 0)
end

-- loops over all of the objects and invokes their update method 
function Scene:update(dt)
    for _, object in pairs(self.objects) do 
        if object:isActive() then
            object:update(dt)
        end
        if self.collides then
            -- implement collision detection
            for _, entity in pairs(self.objects) do
                if object:collides(entity) and object:getID() ~= entity:getID() then
                    object:onCollisionEnter(entity)
                end
            end
        end 
    end
end

-- takes in a class that inherits from 'GameObject' and adds it to the scene
function Scene:add(o)
    if o:isGameObject() then 
        -- first increments the size and counter
        self._size = self._size + 1
        self._counter = self._counter + 1

        -- adds to the Scenes objects at the string value of counter
        self.objects["GameObject" .. tostring(self._counter)] = o
        o:setID("GameObject" .. tostring(self._counter))
    end
end

-- this function is bogus
function Scene:remove(o)    
    if o:isGameObject() then
        self.objects[o:getID()] = nil -- delete the object
    end
    self._size = self._size - 1
end

function Scene:debug(canvas)
    -- love.graphics.setCanvas(canvas) -- load canvas
    local sceneList = {}
    for key, object in pairs(self.objects) do 
        sceneList[object:getName()] = (sceneList[object:getName()] or 0) + 1
    end
    local lineCount = 1
    for key, val in pairs(sceneList) do 
        love.graphics.print(key .. tostring(val), 10, 10*lineCount)
        lineCount = lineCount + 1
    end
    -- love.graphics.setCanvas() -- unload canvas
end 

-- REMOVE AFTER DEBUG
function Scene:printObjs()
    for key, object in pairs(self.objects) do
        print(object:getName() .. " " .. key)
    end
end

function Scene:flush()
    for key, object in pairs(self.objects) do
        if not object:isActive() then -- remove from scene if not active
            self:remove(object)
        end
    end
end

function Scene:updateScore(score)
    self.score = self.score + score
end

return Scene
