function getGlobals()
    require("startup/loadFonts")
    require("startup/resources")
    
    require("global/utilities")
    require("global/gameState")
    gameStateInit()
    
    require("global/cam")
    --vector = require("source/libraries/hump/vector")
    --flux = require("source/libraries/flux")


    require("player")
    require("environment/npc")
  
    require("text/messages")
    require("text/scrollText")
    require("text/textBox")
  
  
  
    sti = require("libraries/sti")
  end
  