-- Controls overall display of scrollText messages

textBox = {}

textBox.active = false

-- Box position and dimensions
textBox.x = 200
textBox.y = 200
textBox.width = 50
textBox.height = 50

-- Where the text will be drawn within the box
textBox.textX = textBox.x + 100
textBox.textY = textBox.y + 100

-- Misc textBox settings
textBox.font = fonts.pickup
textBox.visible = true


function textBox:start(m)

  textBox.active = true

  -- Freezes everything (mostly)
  gameState.state = 0

  if m == "test" then
    textBox:init("test")
  end

  if m == "alain" then
    textBox:init("alain")
  end
  
  if m == "adam" then
    textBox:init("adam")
  end
  
  if m == "douglas" then
    textBox:init("douglas")
  end

  if m == "sandra" then
    textBox:init("sandra")
  end

  if m == "daisy" then
    textBox:init("daisy")
  end

  if m == "celine" then
    textBox:init("celine")
  end


  scroll:showMessage(m)

end


function textBox:update(dt)

  if self.active and scroll.messageObj == nil then
    self.active = false
    gameState.state = 1
  end
end


function textBox:draw()

  if self.active then

    -- Draw black background
    love.graphics.setColor(0, 0, 0, 0.6)
    
    love.graphics.rectangle("fill", self.x * scale, self.y * scale,
      self.width * scale, self.height * scale)

    -- Draw the border of the box
   -- if self.visible then
   --   love.graphics.setColor(1, 1, 1, 1)
   --   love.graphics.setLineWidth(22 * scale)
   --   love.graphics.rectangle("line", self.x * scale, self.y * scale,
   --     self.width * scale, self.height * scale)
   -- end

    -- Draw text
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(self.font)
    if(scroll.title) then
      love.graphics.print(scroll.title, self.titleX * scale, self.titleY * scale)
    end
    love.graphics.print(scroll.text, self.textX * scale, self.textY * scale)

    -- Draw image
    if scroll.messageObj ~= nil and scroll.messageObj.img ~= nil then
      local spr = scroll.messageObj.img
      local w = spr:getWidth()
      local h = spr:getHeight()
      love.graphics.draw(spr, self.x * scale + (self.width * scale / 2),
        -92 * scale + (self.width * scale / 2), nil, scale/4, nil,
        w/2, h/2)
    end

  end

end


function textBox:init(type)

  if type == "test" or type == "alain" or type == "adam" or type == "douglas" or type == "sandra" or type == "daisy" or type == "celine" then
    textBox.x = 60
    textBox.y = gameHeight- 70
    textBox.width = gameWidth-120
    textBox.height = 50
    textBox.titleX = textBox.x + 10
    textBox.titleY = textBox.y + 2
    textBox.textX = textBox.x + 5
    textBox.textY = textBox.y + 10
    textBox.font = fonts.dialog.text
    textBox.visible = true
  end

end