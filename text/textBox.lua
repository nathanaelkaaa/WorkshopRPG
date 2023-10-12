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


  if m == "failedLoad" or m == "tutorial" then
    textBox:init("failedLoad")
  end

  if m == "tutorial" then
    textBox:init("tutorial")
  end

  if m == "intro" then
    textBox:init("intro")
  end

  if m == "test" then
    textBox:init("test")
  end

  scroll:showMessage(m)

end


function textBox:update(dt)

  if self.active and scroll.messageObj == nil then
    self.active = false
    --gameState.state = 1
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

  if type == "pickup" then
    textBox.x = 180
    textBox.y = 180
    textBox.width = gameWidth - 360
    textBox.height = 410
    textBox.textX = textBox.x + 40
    textBox.textY = textBox.y + 226
    textBox.font = fonts.pickup
    textBox.visible = true
  end

  if type == "failedLoad" then
    textBox.x = 180
    textBox.y = 265
    textBox.width = gameWidth - 360
    textBox.height = 170
    textBox.textX = textBox.x + 40
    textBox.textY = textBox.y + 60
    textBox.font = fonts.pickup
    textBox.visible = true
  end

  if type == "tutorial" then
    textBox.x = 180
    textBox.y = 60
    textBox.width = gameWidth - 360
    textBox.height = 189
    textBox.textX = textBox.x + 40
    textBox.textY = textBox.y + 44
    textBox.font = fonts.pickup
    textBox.visible = true
  end

  if type == "intro" then
    textBox.x = -100
    textBox.y = -100
    textBox.width = gameWidth * scale + 200
    textBox.height = gameMap.height * scale + 200
    textBox.textX = 58
    textBox.textY = 104
    textBox.font = fonts.menu.intro
    textBox.visible = false
  end

  if type == "test" then
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