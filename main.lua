-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Require modules
local wheel = require("modules.wheel")
local playerInventory = require("modules.playerInventory")
local raidSteal = require("modules.raidSteal")
local baseUpgrade = require("modules.baseUpgrade")

-- Initialize modules
wheel.init()
playerInventory.init()
raidSteal.init()
baseUpgrade.init()

-- Start the game
wheel.show()
