debug = {}

function debug:update(dt)

end



function debug:draw(layer)
    love.graphics.setColor(0, 0, 1, 1)
    love.graphics.setFont(fonts.dialog.text)
    love.graphics.print(scroll.title,20, 20)
    if scroll.messageObj ~= nil then
        love.graphics.print(scroll.messageObj,20, 40)
    end
    love.graphics.print(scroll.charTimer,20, 100)
    love.graphics.print(scroll.messageNum,20, 120)
    love.graphics.print(scroll.charNum ,20, 140)
    love.graphics.print(string.format("%s\n", tostring(player.active)),20, 160)
    love.graphics.setColor(1, 1, 1, 1)
end
