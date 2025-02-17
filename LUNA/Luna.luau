-- WHAT are you doing here bro

-- // Variables

-- // Services
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

-- // Local variables
local Player = Players.LocalPlayer
local character = Player.Character or Player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local gui = Player.PlayerGui
local screenGui = gui.ScreenGui

-- // Attributes
local isUlted = character:GetAttribute("Ulted")
local currentChar = character:GetAttribute("Character")

-- // End of variables

-- // Character dropdown

    -- // The icon in character dropdown
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconLabel.Text = "Луна"
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconLabel.TextColor3 = Color3.fromRGB(118, 100, 156)
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconLabel.Font = Enum.Font.SciFi

    -- // The icon
    if not isfile("Luna.png") then
        writefile("Luna.png", game:HttpGet("https://images.vexels.com/media/users/3/211367/isolated/preview/2747cfb9e3b7520b0d6a1a55b84224ee-magic-crescent-moon-icon.png"))
    end
    -- // The img label
    gui.TopbarPlus.TopbarContainer.UnnamedIcon.DropdownContainer.DropdownFrame.Esper.IconButton.IconImage.Image = getcustomasset("Luna.png")

-- // End of character dropdown

-- // The script itself
function Load()

    -- // Woahhh relly cool skybox
Lighting.ClockTime = 12
workspace.Terrain.Clouds:Destroy()
Lighting.SunRays:Destroy()
local sky = Instance.new("Sky", Lighting)
sky.CelestialBodiesShown = false
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=9831762777"
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=9831764283"
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=9831766232"
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=9831768023"
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=9831768909"
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=9831769868"
Lighting.Atmosphere.Color = Color3.fromRGB(74, 40, 95)
Lighting.Atmosphere.Decay = Color3.fromRGB(96, 23, 129)
Lighting.Atmosphere.Density = .45
Lighting.Atmosphere.Offset = 1
Lighting.Atmosphere.Glare = 5
Lighting.Atmosphere.Haze = 2.1
-- // End of the really cool skybox

    -- // Music and stuff i guess

-- // The music
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

humanoid.Died:Once(function()
    ultmusic:Stop()
    music:Stop()
end)

-- // End of the music and stuff i guess

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
        ["Сила гравитации"] = {slot = 1, text = "Variant"}, -- "text" is the text that's under the move name, e.g. "USE TWICE"
        ["Воздушный ураган"] = {slot = 2, text = ""},
        ["Сила притяжения"] = {slot = 3, text = ""}, -- Leave it empty if you don't want any text
        ["Воздушный полёт"] = {slot = 4, text = "Use twice"},
    }

    -- // Ultimate move names
    local ultMoves = {
        ["Зов космоса"] = {slot = 1, text = ""},
        ["Хз не придумал"] = {slot = 2, text = ""},
        ["Фатальное притяжение"] = {slot = 3, text = ""},
        ["Небесный полёт"] = {slot = 4, text = ""},
    }

    -- // Functionality

    -- // Set tool names
    local function setName(tbl)
        for name, data in pairs(tbl) do
            local hotbarSlot = gui.Hotbar.Backpack.Hotbar:FindFirstChild(data.slot).Base
            hotbarSlot.ToolName.Text = name
            hotbarSlot.ToolName.Font = Enum.Font.SciFi
            hotbarSlot.Reuse.Text = data.text
            hotbarSlot.Reuse.Reuse.Text = data.text
            hotbarSlot.Reuse.Visible = true
        end
    end

    setName(moves)
    -- // Set tool names after ult
    character:GetAttributeChangedSignal("Ulted"):Connect(function()
        if not isUlted then
            task.wait()
            setName(moves)
        end
    end)

    -- // Set tool names when using ult
    Player.Backpack.ChildAdded:Connect(function(tool)
        if tool.Name == "Cosmic Strike" then
            task.wait()
            setName(ultMoves)
        end
    end)

    -- // End of moves&ultimate

    -- // Move animations

    -- // Choose the animations
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

    getgenv().Idle = humanoid.AnimationPlayed:Connect(function(v)
        if v.Animation.AnimationId == "rbxassetid://14516273501" then
            local Anim = Instance.new("Animation")
            Anim.AnimationId = "rbxassetid://73949048256257"
            local k = humanoid:LoadAnimation(Anim)
    
            k.Priority = Enum.AnimationPriority.Idle
            k.Looped = true
            k:Play()
            k:AdjustSpeed(0)
    
            local startTime = 0 -- First keyframe
            local endTime = 1.5   -- Second keyframe
            local cycleDuration = 3 -- Time for a full A -> B -> A cycle
            local timeElapsed = 0
    
            local connection
            connection = RunService.Heartbeat:Connect(function(deltaTime)
                timeElapsed = (timeElapsed + deltaTime) % (cycleDuration * 2)
    
                local alpha = (math.sin((timeElapsed / cycleDuration) * math.pi - math.pi / 2) + 1) / 2
                k.TimePosition = startTime + (endTime - startTime) * alpha
            end)
    
            v.Stopped:Wait()
            k:Stop(0.3)
            connection:Disconnect()
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
    else return end
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
    Load()
end

-- // End of func to switch char
