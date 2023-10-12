npcs = {}

function spawnNpc(x, y, id, size)
    local npc = {}
    npc.width = 25
    npc.height = 10
    npc = world:newBSGRectangleCollider(x,y,npc.width, npc.height,3)
    npc.sprite = sprites.npc.sprite
    npc.spriteSheet = sprites.npc.spriteSheet
    npc.grid = anim8.newGrid(16, 23, npc.spriteSheet:getWidth(), npc.spriteSheet:getHeight())


    npc:setFixedRotation(true)

    npc.animations = {}
    npc.animations.down = anim8.newAnimation( npc.grid(1, '1-2'), 1 )
    npc.animations.up = anim8.newAnimation( npc.grid(2, '1-2'), 1 )
    npc.animations.right = anim8.newAnimation( npc.grid(3, '1-2'), 1 )
    npc.animations.left = anim8.newAnimation( npc.grid(4, '1-2'), 1 )

    npc.animations.down.active = anim8.newAnimation( npc.grid(1, '3-4'), 1 )
    npc.animations.up.active = anim8.newAnimation( npc.grid(2, '3-4'), 1 )
    npc.animations.right.active = anim8.newAnimation( npc.grid(3, '3-4'), 1 )
    npc.animations.left.active = anim8.newAnimation( npc.grid(4, '3-4'), 1 )



    npc.anim = npc.animations.down

    npc:setType('static')
    npc.state = 0
    npc.x = x- 2.5
    npc.y = y- 38
    npc.id = id
    npc.size = "small"
    npc.state = 0
    npc.layer = -1
    if size then npc.size = size end









    -- if the id is in this list, the npc was already opened
    --if data.npcs[id] then
        --npc.state = 1
   -- end

    if npc.size == "small" then
        npc.width = 25
        npc.height = 10
    elseif npc.size == "big" then
        npc.width = 20
        npc.height = 15
    end

    -- Wall spawned overtop of the npc, passed npc as parent
    --local wall = world:newBSGRectangleCollider(x,y,npc.width,npc.height,5)
    --wall:setType('static')
    --wall.parent = npc
    --table.insert(walls,wall)



    function npc:interact()
            if love.keyboard.isDown('e') then
                    if textBox.active == false then
                        textBox:start("test")
                    end
            end
                




            --if self.state == 0 then
                --self.state = 1
                --dj.play(sounds.items.npc, "static", "effect")
                --data.npcs[self.id] = true
                --if self.size == "small" then
                    --npcs:spawnSmallLoot(self.centerX, self.centerY, self.id)
                --elseif self.size == "big" then
                    --player:gotItem(npcs:getBigLoot(self.id), true)
                --end
            --end
    end

    function npc:update(dt)
            
            if distanceBetween(self.x+(self.width/2)+3, self.y+(self.height/2)+33, player:getX(), player:getY()) < 30 then
                self.state = 1 --Si le personnage est a bonne distance
                self:interact()
            else 
                self.state = 0 --Si le personnage n'est pas a bonne distance
            end

            if self.y + 2 < player:getY() then
                self.layer = -1
            else
                self.layer = 1
            end
            npc.anim:update(dt)
    end
    
    table.insert(npcs, npc)
end


function npcs:update(dt)
    for _,c in ipairs(npcs) do
        c:update(dt)
    end
end

function npcs:draw(layer)
    love.graphics.setColor(1,1,1,1)
    
    for _,n in ipairs(npcs) do
        if n.layer == layer then
            if n.state == 0 and n.size == "small" then
                n.anim = n.animations.down
                n.anim:draw(n.spriteSheet, n.x, n.y, nil, 2.5, nil, 2, 2)
                --love.graphics.draw(sprites.npc.stand, c.x, c.y, nil,2,2 )
                --love.graphics.circle( "fill", n.x+(n.width/2)+3, n.y+(n.height/2)+33, 2 )
     
            elseif n.state == 1 and n.size == "small" then
                n.anim = n.animations.down.active
                n.anim:draw(n.spriteSheet, n.x, n.y, nil, 2.5, nil, 2, 2)
                --love.graphics.draw(sprites.npc.active, n.x, n.y,nil,2,2 )
            elseif n.state == 0 and n.size == "big" then
                love.graphics.draw(sprites.npc.stand, n.x, n.y)
            elseif n.state == 1 and n.size == "big" then
                love.graphics.draw(sprites.npc.active, n.x, n.y)
            end
        end
    end
end

function npcs:spawnSmallLoot(x, y, id)
    local function getJumpVec(dirX, dirY, speed)
        local vecSpeed = 30
        if speed then vecSpeed = speed end
        return vector(dirX, dirY):normalized() * vecSpeed
    end

    if id == 'test1' then
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(-1, 1))
        spawnLoot(x, y, "coin1", true, nil, getJumpVec(1, 1))
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(1, 0))
    elseif id == 'test2' then
        spawnLoot(x, y, "coin3", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "coin3", true, nil, getJumpVec(1, 0))
    elseif id == 'test3' then
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(-1, 0))
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(-1, 1))
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(1, 1))
        spawnLoot(x, y, "coin2", true, nil, getJumpVec(1, 0))
    elseif id == 'testKey' then
        spawnLoot(x, y, "key", true, nil, getJumpVec(1, 1))
    end
end

function npcs:getBigLoot(id)
    if id == 'test2' then
        return sprites.items.boomerang
    end
end
