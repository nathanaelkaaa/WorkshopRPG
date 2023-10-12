    player = world:newBSGRectangleCollider(300, 150, 25, 10, 3)
    player.x = 300
    player.y = 150
    player.speed = 150
    player.sprite = sprites.player.sprite
    player.spriteSheet = sprites.player.spriteSheet
    player.grid = anim8.newGrid(12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())

    player:setFixedRotation(true)


    player.animations = {}
    player.animations.down = anim8.newAnimation( player.grid('1-4', 1), 0.2 )
    player.animations.left = anim8.newAnimation( player.grid('1-4', 2), 0.2 )
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 )
    player.animations.up = anim8.newAnimation( player.grid('1-4', 4), 0.2 )

    player.anim = player.animations.left

 




    function player:update(dt)

        local isMoving = false

        local vx = 0
        local vy = 0
    

        if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
            vx = player.speed
            player.anim = player.animations.right
            isMoving = true
        end

        if love.keyboard.isDown("left") or love.keyboard.isDown("q") then
            vx = player.speed * -1
            player.anim = player.animations.left
            isMoving = true
        end

        if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
            vy = player.speed
            player.anim = player.animations.down
            isMoving = true
        end

        if love.keyboard.isDown("up") or love.keyboard.isDown("z") then

            vy = player.speed * -1
            player.anim = player.animations.up
            isMoving = true
        end

        player:setLinearVelocity(vx, vy)

        if isMoving == false then
            player.anim:gotoFrame(2)
        end

        player.x = player:getX()
        player.y = player:getY()-20 -- to have collider at the feet of character
        player.anim:update(dt)

    end


    