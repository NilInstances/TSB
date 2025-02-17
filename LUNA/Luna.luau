-- // Variables

-- // Services
local Chat = game:GetService("Chat")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- // Local variables
local Player = Players.LocalPlayer
local character = Player.Character or Player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local gui = Player.PlayerGui
local screenGui = gui.ScreenGui

-- // Attributes
local combo = character:GetAttribute("Combo")
local isUlted = character:GetAttribute("Ulted")
local currentChar = character:GetAttribute("Character")
-- // End of variables

-- // Character dropdown

    -- // The icon in character dropdown
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconLabel.Text = "Луна"
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconLabel.Font = Enum.Font.SciFi

    -- // Um
    if not isfile("Luna.png") then
        writefile("Luna.png", game:HttpGet("https://images.vexels.com/media/users/3/211367/isolated/preview/2747cfb9e3b7520b0d6a1a55b84224ee-magic-crescent-moon-icon.png"))
    end
    -- // The img label
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconImage.Image = getcustomasset("Luna.png")

-- // End of character dropdown

-- // The yes
if not isfile("KOCMOC.mp3") then
    writefile("KOCMOC.mp3", game:HttpGet("https://github.com/NilInstances/_/raw/refs/heads/main/KOCMOC.mp3"))
end
local music = Instance.new("Sound", workspace)
music.SoundId = getcustomasset("KOCMOC.mp3")
music.Looped = true
music:Play()
if not isfile("UNLEASHED.mp3") then
    writefile("UNLEASHED.mp3", game:HttpGet("https://github.com/NilInstances/_/raw/refs/heads/main/KOCMOC%20UNLEASHED.mp3"))
end
local ultmusic = Instance.new("Sound", workspace)
ultmusic.SoundId = getcustomasset("KOCMOC.mp3")

character:GetAttributeChangedSignal("Ulted"):Connect(function()
    if isUlted then
        music:Stop()
        ultmusic:Play()
    else
        ultmusic:Stop()
        music:Play()
    end
end)
-- // End of the yes


-- // Func to switch char
local args = {
    [1] = {
        ["Goal"] = "Change Character",
        ["Character"] = "Esper"
    }
}

local bindable = Instance.new("BindableFunction")

function bindable.OnInvoke(response)
    if response == "Yes" then
        character.Communicate:FireServer(unpack(args))
        loadScript()
    else
        return
    end
end

if currentChar ~= "Esper" then
    StarterGui:SetCore("SendNotification", {
        Title = "Warning";
        Text = "This script is for Tatsumaki. Would you like to switch?";
        Duration = 5;
        Callback = bindable,
        Button1 = "Yes",
        Button2 = "No"
    })
else
    loadScript()
end

-- // End of func to switch char

-- // The rest of the script
function loadScript()
    -- // The hotbar
    
    -- // Moves&ultimate

    -- // Ultimate name
    character:SetAttribute("UltimateName", "Небесное вознесение")

    -- // Ultimate bar
    screenGui.MagicHealth.Health.Bar.Bar.ImageColor3 = Color3.fromRGB(84, 65, 170)
    screenGui.MagicHealth.Health.Glow.Image = "rbxassetid://17136251821"
    screenGui.MagicHealth.Health.Bar.Image = "rbxassetid://17136251960"
    screenGui.MagicHealth.Health.Bar.Image = "rbxassetid://17136251960"
    screenGui.MagicHealth.Health.Bar.Bar.Image = "rbxassetid://17136251960"
    screenGui.MagicHealth.TextLabel.Font = Enum.Font.SciFi
    screenGui.MagicHealth.TextLabel.TextLabel.Font = Enum.Font.SciFi
    -- // Move names
    local moves = {
        ["Move Name 1"] = {slot = 1, text = "A lil text"}, -- "text" is the text that's under the move name, e.g. "USE TWICE"
        ["Move Name 2"] = {slot = 2, text = "Some text"},
        ["Move Name 3"] = {slot = 3, text = ""}, -- Leave it empty if you don't want any text
        ["Move Name 4"] = {slot = 4, text = ""},
    }

    -- // Ultimate move names
    local ultMoves = {
        ["Ult Move Name 1"] = {slot = 1, text = "Some text"},
        ["Move Name 2"] = {slot = 2, text = "Another text"},
        ["Move Name 3"] = {slot = 3, text = ""},
        ["Move Name 4"] = {slot = 4, text = ""},
    }

    -- // The functionality

    -- // Update hotbar slots
    local function setToolName(tbl)
        for name, data in pairs(tbl) do
            local hotbarSlot = gui.Hotbar.Backpack.Hotbar:FindFirstChild(data.slot).Base
            hotbarSlot.ToolName.Text = name
            hotbarSlot.Reuse.Text = data.text
            hotbarSlot.Reuse.Reuse.Text = data.text
            hotbarSlot.Reuse.Visible = true
        end
    end

    setToolName(moves)
    -- // Set tool names after ult
    character:GetAttributeChangedSignal("Ulted"):Connect(function()
        if not isUlted then
            task.wait()
            setToolName(moves)
        end
    end)

    -- // Set tool names when using ult
    Player.Backpack.ChildAdded:Connect(function(tool)
        if tool.Name == "Death Counter" then -- [[Change this to an ult move of your character]]
            task.wait()
            setToolName(ultMoves)
        end
    end)

    -- // End of moves&ultimate

    -- // Move animations

    -- // Choose the animations
    local Idle = "95849504825" -- Replace with your animation id
    local Walk = "95849504825"

    local m1 = "95849504825" -- M1s
    local m2 = "95849504825"
    local m3 = "95849504825"
    local m4 = "95849504825"

    local Move1 = "95849504825" -- Normal moves
    local Move2 = "95849504825"
    local Move3 = "95849504825"
    local Move4 = "95849504825"

    local Ult = "95849504825" -- Ultimate awakening

    local UltMove1 = "140145728452253" -- Normal moves
    local UltMove2 = "95849504825"
    local UltMove3 = "95849504825"
    local UltMove4 = "95849504825"
    -- // End of choosing animations

    -- // The actual animations themselves

    -- // Idle
    pcall(function() getgenv().Idle:Disconnect() end)

    getgenv().Idle = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Idle
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Idle
            loadedAnim:Play()
        end
    end)

    -- // Walk
    pcall(function() getgenv().Walk:Disconnect() end)

    getgenv().Walk = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Walk
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Movement
            loadedAnim:Play()
        end
    end)

    -- // M1
    pcall(function() getgenv().one:Disconnect() end)

    getgenv().one = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. m1
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // M2
    pcall(function() getgenv().two:Disconnect() end)

    getgenv().two = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. m2
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // M3
    pcall(function() getgenv().three:Disconnect() end)

    getgenv().three = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. m3
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // M4
    pcall(function() getgenv().four:Disconnect() end)

    getgenv().four = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. m4
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Move 1
    pcall(function() getgenv().move1:Disconnect() end)

    getgenv().move1 = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Move1
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Move 2
    pcall(function() getgenv().move2:Disconnect() end)

    getgenv().move2 = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Move2
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Move 3
    pcall(function() getgenv().move3:Disconnect() end)

    getgenv().move3 = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Move3
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Move 4
    pcall(function() getgenv().move4:Disconnect() end)

    getgenv().move4 = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Move4
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Ult awakening
    pcall(function() getgenv().ult:Disconnect() end)

    getgenv().ult = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Ult
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Ult move 1
    pcall(function() getgenv().ult:Disconnect() end)

    getgenv().ult = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Ult
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Ult move 2
    pcall(function() getgenv().ult:Disconnect() end)

    getgenv().ult = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Ult
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Ult move 3
    pcall(function() getgenv().ult:Disconnect() end)

    getgenv().ult = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Ult
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)

    -- // Ult move 4
    pcall(function() getgenv().ult:Disconnect() end)

    getgenv().ult = humanoid.AnimationPlayed:Connect(function(animationTrack)
        if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://" .. Ult
            local loadedAnim = humanoid:LoadAnimation(anim)

            loadedAnim.Priority = Enum.AnimationPriority.Action2
            loadedAnim:Play()
        end
    end)
end
