function gameStart()

    love.graphics.setBackgroundColor(26/255, 26/255, 26/255)

    -- Make pixels scale!
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- 3 parameters: fullscreen, width, height
    -- width and height are ignored if fullscreen is true
    fullscreen = false
    testWindow = false
    vertical = false
    gameWidth = 300 --size of the screen / use for textBox
    gameHeight = 175
    setWindowSize(fullscreen, 1920, 1080)


    -- The game's graphics scale up, this method finds the right ratio
    setScale()

    anim8 = require("libraries/anim8")
    sti = require("libraries/sti")

    local windfield = require("libraries/windfield")
    world = windfield.newWorld(0, 0, false)
    world:setQueryDebugDrawing(true)


    -- Requires all global source files
    require("startup/main_require")
    getGlobals()

end

function setWindowSize(full, width, height)
    if full then
        fullscreen = true
        love.window.setFullscreen(true)
        windowWidth = love.graphics.getWidth()
        windowHeight = love.graphics.getHeight()
    else
        fullscreen = false
        if width == nil or height == nil then
            windowWidth = 1920
            windowHeight = 1080
        else
            windowWidth = width
            windowHeight = height
        end
        love.window.setMode( windowWidth, windowHeight, {resizable = not testWindow} )
    end
end



function setScale(input)
    scale = (7.3 / 1200) * windowHeight

    if vertical then
        scale = (7 / 1200) * windowHeight
    end

    if cam then
        cam:zoomTo(scale)
    end
end

function checkWindowSize()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    if width ~= windowWidth or height ~= windowHeight then
        reinitSize()
    end
end

function reinitSize()
    -- Reinitialize everything
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()
    setScale()
    pause:init()
    initFonts()
end
