
function love.load()

    require("startup/gameStart")
    gameStart()

    love.graphics.setDefaultFilter("nearest", "nearest")

    gameMap = sti('maps/map.lua')

 

    

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
    
    if gameMap.layers["npc"] then
        for i, obj in pairs(gameMap.layers["npc"].objects) do
            spawnNpc(obj.x, obj.y, obj.name, obj.type)
        end
    end
    
end

function love.update(dt)
    
    player:update(dt)
    world:update(dt)

    scroll:update(dt)
    textBox:update(dt)
    npcs:update(dt)
    cam:update(dt)
    debug:update(dt)

end

function love.draw()
    gameMap:resize(1152,768)
    cam:attach()
        gameMap:drawLayer(gameMap.layers["ground"])
        gameMap:drawLayer(gameMap.layers["wall_2"])
        gameMap:drawLayer(gameMap.layers["item_backward"])
        gameMap:drawLayer(gameMap.layers["wall"])
        gameMap:drawLayer(gameMap.layers["table_2"])
        gameMap:drawLayer(gameMap.layers["table"])
        gameMap:drawLayer(gameMap.layers["item_forward_2"])
        gameMap:drawLayer(gameMap.layers["item_forward"])
        gameMap:drawLayer(gameMap.layers["deco_no_col"])
        npcs:draw(-1)
        npcs:draw(1)
        player.anim:draw(player.spriteSheet, player.x, player.y, nil, 2.5, nil, 6, 9)
        gameMap:drawLayer(gameMap.layers["item_backward_no_col"])
        --world:draw()
    cam:detach()
    textBox:draw()

end
