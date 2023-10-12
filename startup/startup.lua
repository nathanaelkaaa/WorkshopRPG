function startup()

    -- Game resolution
    gameWidth = 300
    gameHeight = 768
  
    scale = 50 -- adjusts game window to screen size
    offset = 0.8 -- window size relative to scale
  
    local screen_width, screen_height = love.window.getDesktopDimensions()
    local w_scale = screen_width / gameWidth
    local h_scale = screen_height / gameHeight
  
    -- scale set to be the lesser of w_scale and h_scale
    -- this way, the game window will not ever exceed screen size
    if w_scale < h_scale then
      scale = w_scale
    else
      scale = h_scale
    end
  
    scale = scale * offset
  
    love.window.setMode(gameWidth * scale, gameHeight * scale, {fullscreen = false,
      fullscreentype = "desktop", resizable = false, borderless = false,
      vsync = true})

      
  
  
    -- GAME SETUP
  
    -- Physics setup
    -- Windfield is a library that makes LOVE's physics easier to work with
    -- https://github.com/SSYGEN/windfield
    local wf = require 'libraries/windfield'
    world = wf.newWorld(0, 0) -- No gravity, bodies can sleep
  

  
    -- Requires all global source files
    require("startup/main_require")
    getGlobals()
  end



  

  
  