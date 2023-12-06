local Background = {}

function Background:new()
    -- Load background image or animation
    self.image = love.graphics.newImage("Assets/Sprites/planetsBackgroundScrolling.png")
    self.scrollSpeed = 30  -- Adjust the scrolling speed as needed
    self.y = -300
end

function Background:draw()
    -- Draw the background image or animation
    love.graphics.draw(self.image, 0, self.y)
end

function Background:update(dt)
    -- Update the background position for scrolling effect
    self.y = self.y + self.scrollSpeed * dt

    -- Reset the position to create a continuous scrolling effect
    if self.y >= 300 then
        self.y = -300
    end
end

return Background