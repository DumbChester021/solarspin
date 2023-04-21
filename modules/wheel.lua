local composer = require("composer")
local widget = require("widget")

local M = {}

local wheelGroup
local wheelImage = "assets/images/wheel.png"
local wheel
local wheelRotation = 0
local spinButton
local rewards = {"spinTokens", "goldCoins", "goldBars", "raids", "steals", "shields"}
local rewardSegments = #rewards

function M.init()
    wheelGroup = display.newGroup()
    wheel = display.newImageRect(wheelGroup, wheelImage, 300, 300)
    wheel.x = display.contentCenterX
    wheel.y = display.contentCenterY

    spinButton = widget.newButton({
        x = display.contentCenterX,
        y = display.contentCenterY + 200,
        label = "Spin",
        onRelease = spinWheel,
    })

    wheelGroup:insert(spinButton)
end


local function spinWheel()
    local randomSpin = math.random(360, 720) -- Spin at least once, and up to two times
    local targetRotation = wheelRotation + randomSpin

    transition.to(wheel, {
        rotation = targetRotation,
        time = 3000,
        transition = easing.outQuad,
        onComplete = function()
            wheelRotation = wheel.rotation % 360
            local reward = calculateReward()
            print("Reward: " .. reward)
        end,
    })
end

local function calculateReward()
    local rewardIndex = math.ceil((360 - wheelRotation) / (360 / rewardSegments))
    return rewards[rewardIndex]
end


function M.show()
    wheelGroup.isVisible = true
end


return M
