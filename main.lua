

function love.load()
    wf = require 'librairies/windfield'
    world = wf.newWorld(0, 0)

    camera = require 'librairies/camera'
    cam = camera()

    anim8 = require 'librairies/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest")

    sti = require 'librairies/sti'
    gameMap = sti('maps/map.lua')

    player = {}
    player.collider = world:newBSGRectangleCollider(400, 250, 25, 45, 5)
    player.collider:setFixedRotation(true)
    player.x = 400
    player.y = 200
    player.speed = 150
    player.sprite = love.graphics.newImage('sprites/player.png')
    player.spriteSheet = love.graphics.newImage('sprites/player-sheet.png')
    player.grid = anim8.newGrid(12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )

    player.anim = player.animations.left

    background = love.graphics.newImage('sprites/background.png')

    --Collision with environnement
    walls = {}
    if gameMap.layers["walls"] then
        for i, obj in pairs(gameMap.layers["walls"].objects) do
            local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
            wall:setType('static')
            table.insert(walls,wall)
        end
    end 
    if gameMap.layers["chairs"] then
        for i, obj in pairs(gameMap.layers["chairs"].objects) do
            local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
            wall:setType('static')
            table.insert(walls,wall)
        end
    end 
    if gameMap.layers["decos"] then
        for i, obj in pairs(gameMap.layers["decos"].objects) do
            local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
            wall:setType('static')
            table.insert(walls,wall)
        end
    end 
    if gameMap.layers["tables"] then
        for i, obj in pairs(gameMap.layers["tables"].objects) do
            local wall = world:newRectangleCollider(obj.x,obj.y,obj.width,obj.height)
            wall:setType('static')
            table.insert(walls,wall)
        end
    end 
end

function love.update(dt)
    local isMoving = false

    local vx = 0
    local vy = 0



    if love.keyboard.isDown("right") then
        vx = player.speed
        player.anim = player.animations.right
        isMoving = true
    end

    if love.keyboard.isDown("left") then
        vx = player.speed * -1
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        vy = player.speed
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        vy = player.speed * -1
        player.anim = player.animations.up
        isMoving = true
    end

    player.collider:setLinearVelocity(vx, vy)

    if isMoving == false then
        player.anim:gotoFrame(2)
    end

    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()

    player.anim:update(dt)

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    -- Left border
    if cam.x < w/2 then
        cam.x = w/2
    end 

    -- Top border
    if cam.y < h/2 then
        cam.y = h/2
    end 

    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight


    -- Right border
    if cam.x > (mapW - w/2) then
        cam.x = (mapW - w/2)
    end 

    -- Bottom border
    if cam.y >  (mapH - h/2) then
        cam.y = (mapH - h/2)
    end 

end

function love.draw()
    love.graphics.print("Hello world ", 400, 400)

end