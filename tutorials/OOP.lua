--- Object Oriented Programming Tutorial in Lua
-- In lua there are no other data structures besides the Table
-- However, we can utilize special built-in functions that lua provides 
-- to manufacture our own OOP paradigms

local Base = {} -- Parent Class

-- some examples of class variables
Base.a = 1 
Base.b = "2"

-- this function acts as a constructor for the Base class
-- we used a colon here... this acts as "syntatic sugar" for passing in the object on which
-- the method is called as the first parameter. 
function Base:new() 
    local instance = {} -- this is the instantiated "object" that the constructor returns
    -- this is where the magic happens...
    -- a "metatable" in lua is a table that defines the behavior of another table
    -- any table can have a metatable associated with it
    setmetatable(instance, self) 
    -- Sidenote: the previous two lines of code could be combined to: 
    -- local instance = setmetatable({}, self)
    -- as the setmetatable function returns the table passed into it

    -- a special metamethod defined by lua
    -- the __index method is called when you try and access a key not present in the table
    -- this is primarily used to "inherit" from other lua classes; here it sets a base case of sorts
    self.__index = self
end

local myClass = Base:new() -- setting the table "myClass" to inherit from Base 

