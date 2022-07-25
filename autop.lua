--[[
IMPORTANT;

Just a word of warning, this script is not perfect,
and someone else could probably make a waaaaaay better script than I did.


For this to work, you must have a weapon that can parry equipped.
    Originally it would do it for you, but I kept getting kicked for equipping weapons 'abnormally fast'

By default, the auto-parry distance is 15 units,
meaning all who attack within 15 units of your character will force a parry.

This value can be changed by saying /e changeParryDist x
Change x to any number you'd like

If you want to blacklist a friend from activating your parry, type /e blacklistAdd x
Change x to the EXACT name of the player

If someone's invoked a change of heart from you,
you can always remove them with /e blacklistRemove x

If you want, the script can attempt to make your character face the attacker,
you can toggle this with /e faceAttackers x
change x to either true or false
Beware, it's a tad bit buggy

That's all, Have fun!

P.S. The chat messages are just a sanity check, if you don't want them, type /e chat
]]

local disableChatMessages = false --Turn this to false if you don't want my chat messages
local autoFaceAttackers = false --Turn this to false if you don't want the script to automatically face attackers
local parryDist = 13 --Anyone attacking within this many units of your character will trigger auto-parry
local blacklist = {"someone you like", "someone else you like"} --Put the names of your friends here, separated by commas

--You may not want to mess with the stuff below, but if you know what you're doing, go ahead!
local plr = game.Players.LocalPlayer
local char = plr.Character
local runService = game:GetService("RunService")

local animIds = {
    "rbxassetid://5416575259";
    "rbxassetid://5428578390";
    "rbxassetid://5428613396";
    "rbxassetid://5435382827";
    "rbxassetid://5435969402";
    "rbxassetid://5431979188";
    "rbxassetid://5436083192";
    "rbxassetid://5436059670";
    "rbxassetid://4061495031";
    "rbxassetid://3857610554";
    "rbxassetid://3857630958";
    "rbxassetid://5435928313";
    "rbxassetid://5424166879";
} --Probably a better way to go about it, but this game has relatively few animations.

local cmds = {}
cmds.changeParryDist = function(x)
    local oldParryDist = parryDist
    parryDist = tonumber(x) or parryDist
    
    if tonumber(x) then
        makeMessage("parryDist changed from ".. oldParryDist.. " to ".. parryDist, Color3.fromRGB(0, 255, 0))
    else
        makeMessage(x.. " must be a float or numeric value!", Color3.fromRGB(255, 0, 0))
    end    
end
cmds.blacklistAdd = function(x)
    if game.Players:FindFirstChild(x) then
        table.insert(blacklist, tostring(x))
        makeMessage("Player '".. x.. "' added to blacklist!", Color3.fromRGB(0, 255, 0))
    else
        makeMessage("Player '".. x "' not found!", Color3.fromRGB(255, 0, 0))
    end
end
cmds.blacklistRemove = function(x)
    local index = table.find(blacklist, x)
    if index then
        table.remove(blacklist, index)
        makeMessage("Player '".. x .. "' removed from blacklist!", Color3.fromRGB(0, 255, 0))
    else
        makeMessage("Player '".. x .. "' not found in blacklist", Color3.fromRGB(255, 0, 0))
    end
end
cmds.faceAttackers = function(x)
    if x == "true" then
        autoFaceAttackers = true
    else
        autoFaceAttackers = false
    end
    makeMessage("autoFaceAttackers set to ".. tostring(autoFaceAttackers), Color3.fromRGB(0, 255, 0))
end
cmds.makeMessages = function(x)
    local bool
    if x == "true" then
        bool = true
    else
        bool = false
    end
    makeMessage("disableChatMessages set to ".. tostring(disableChatMessages), Color3.fromRGB(0, 255, 0))
    disableChatMessages = bool
end

plr.Chatted:Connect(function(msg)
    local splitMsg = string.split(msg, "/e ")
    splitMsg = splitMsg[2]
    local splitSplitMsg = string.split(splitMsg, " ")
    local cmd = splitSplitMsg[1]
    local var = splitSplitMsg[2]
    cmds[cmd](var)
end)

function makeMessage(message, color)
    if not disableChatMessages then
        color = color or Color3.fromRGB(255, 255, 255)
        game.StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = message;
            Color = color;
        })
    end
end

function getParryEvent()
    for i, v in next, char:GetDescendants() do
        if v:IsA("RemoteEvent") and v.Name == "ability" then
            return v
        end
    end
    return nil
end

function parry()
    local myParryEvent = getParryEvent()
    if myParryEvent then
        myParryEvent:FireServer()
    end
end

makeMessage("Auto-Parry loaded! If you're new, you may want to check the top of the script for more info.", Color3.fromRGB(124,185,232))
function main()
    while true do
        pcall(function()
            char = plr.Character
            runService.RenderStepped:Wait()
            for i, plrChar in next, workspace.PlayersCharacters:GetChildren() do
                if plrChar ~= char and not table.find(blacklist, plrChar.Name) then
                    local anims = plrChar.Humanoid:GetPlayingAnimationTracks()
                    for _, anim in next, anims do
                        if table.find(animIds, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= parryDist and plrChar.Humanoid.Health > 0 and not plrChar.Humanoid.PlatformStand then
                                parry()
                                if autoFaceAttackers then
                                    local vector = char.HumanoidRootPart.Orientation
                                    for i = 1, 10 do --A loop to make your character face the aggressor, as parrying doesn't protect your rear
                                        char.HumanoidRootPart.CFrame = char:SetPrimaryPartCFrame(CFrame.new(char.HumanoidRootPart.Position, plrChar.HumanoidRootPart.Position))
                                        wait()
                                    end
                                end
                                wait(1) --Prevents mass event firing
                            end
                        end
                    end
                end    
            end
        end)
    end
end
        
main()
--sup
