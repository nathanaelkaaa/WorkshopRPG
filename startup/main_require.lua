function getGlobals()
    require("startup/loadFonts")
    
    
    require("global/utilities")
    require("global/gameState")
    gameStateInit()
    
    camera = require("librairies/camera")
    --vector = require("source/libraries/hump/vector")
    --flux = require("source/libraries/flux")
    anim8 = require("librairies/anim8")
  
  
    require("text/messages")
    require("text/scrollText")
    require("text/textBox")
  
  
  
    sti = require("librairies/sti")
  end
  