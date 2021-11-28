loadstring(game:HttpGet('https://raw.githubusercontent.com/ALWEB2/robloxhacks/main/mortem.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ALWEB2/robloxhacks/main/aimbot.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ALWEB2/robloxhacks/main/ESP.lua'))()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

local SetWalk = 20
local disableChatMessages = false --Turn this to false if you don't want my chat messages
local autoFaceAttackers = false --Turn this to false if you don't want the script to automatically face attackers
local parryDist = 13 --Anyone attacking within this many units of your character will trigger auto-parry
local blacklist = {} --Put the names of your friends here, separated by commas

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

humanoid = game.Players.LocalPlayer.Character.Humanoid
while wait(0.3) do
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(SetWalk)
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
                                wait(0.6) --Prevents mass event firing
                            end
                        end
                    end
                end    
            end
            
    --if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == tonumber(SetWalk) then
       --game.Players.LocalPlayer.Character.Runscript.run:FireServer()
    --end
    
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity") then
       game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BodyVelocity"):Destroy()
    end
    game.Players.LocalPlayer.Character.Humanoid.MaxHealth = 500
    game.Players.LocalPlayer.Character.Humanoid.Health = 500
    game.Players.LocalPlayer.Character.Health.Disabled = true
    game.Players.LocalPlayer.Character.RagdollSound.Disabled = true
    game.Players.LocalPlayer.Character.Fall.Disabled = true
    game.Players.LocalPlayer.Character.Runscript.Disabled = true
    game.Players.LocalPlayer.Character.JumpCooldown.Disabled = true
game.Players.LocalPlayer.Character.Runscript.Stamina.Value = 100
--game.Players.LocalPlayer.Character.Runscript.SlowDown.Value = 1.2
--autorun but buggy
--game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25 --Walkspeed of your choice
end
