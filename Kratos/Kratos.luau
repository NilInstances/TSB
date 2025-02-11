-- [[_______________________________________________VARS____________________________________________]]
-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- Variables
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local playerGui = localPlayer.PlayerGui
local screenGui = playerGui.ScreenGui
local humanoid = character and character.Humanoid
local humanoidRootPart = character.HumanoidRootPart
-- Attributes
local isUlted = character:GetAttribute("Ulted")
-- [[____________________________________________START OF GUI____________________________________________]]
-- [[ULT NAME]]
character:SetAttribute("UltimateName", "GOD OF WAR.")

-- [[ULT COLOR]]
screenGui.MagicHealth.Health.Bar.Bar.ImageColor3 = Color3.fromRGB(66, 9, 9)

-- DEFAULT MOVES
local defaultMoves = {
    ["Spartan Punch"] = {slot = 1, txt = ""},
    ["Titan's Rage"] = {slot = 2, txt = ""},
    ["Olympian Cleave"] = {slot = 3, txt = ""},
    ["Titan Ascendant"] = {slot = 4, txt = ""}
}

-- ULT MOVES
local ultMoves = {
    ["Biggest Regret"] = {slot = 1, txt = ""},
    ["Destroyer Of Gods"] = {slot = 2, txt = ""},
    ["Titan Blast"] = {slot = 3, txt = ""},
    ["Brutal Execution"] = {slot = 4, txt = ""}
}
for moveName, moveData in pairs(defaultMoves) do
    local hotbarSlot = playerGui.Hotbar.Backpack.Hotbar:FindFirstChild(moveData.slot).Base
        hotbarSlot.ToolName.Text = moveName
end

character:GetAttributeChangedSignal("Ulted"):Connect(function()
        if not isUlted then
        task.wait(.1)
            for moveName, moveData in pairs(defaultMoves) do
                local hotbarSlot = playerGui.Hotbar.Backpack.Hotbar:FindFirstChild(moveData.slot).Base
                    hotbarSlot.ToolName.Text = moveName
            end
        end
end)
-- just because the ulted variable activates instantly when you activate ult, this method tracks if you have an ult move in your backpack
localPlayer.Backpack.ChildAdded:Connect(function(tl)
    if tl.Name == "Death Counter" then -- [[change this to an ult move of your character]]
        for moveName, moveData in pairs(ultMoves) do
		task.wait()
            local tool = localPlayer.Backpack:FindFirstChild(tl.Name)
            if tool then
                local f = playerGui.Hotbar.Backpack.Hotbar:FindFirstChild(moveData.slot).Base 
                f.ToolName.Text = moveName
            end
        end
    end
end)

-- [[____________________________________________END OF GUI____________________________________________]]

-- [[____________________________________________MISC STUFF____________________________________________]]

-- BLADES
local rightArm = character:FindFirstChild("Right Arm")
local leftArm = character:FindFirstChild("Left Arm")

local function createBlade(arm, name, positionOffset, rotation)
    local blade = Instance.new("Part")
    blade.Name = name
    blade.BottomSurface = Enum.SurfaceType.Smooth
    blade.TopSurface = Enum.SurfaceType.Smooth
    blade.Size = Vector3.new(4, 1, 2)
    blade.Anchored = false
    blade.CanCollide = false
    blade.Massless = true -- Prevents movement issues

    local mesh = Instance.new("SpecialMesh")
    mesh.Scale = Vector3.new(40, 40, 50)
    mesh.MeshId = "rbxassetid://3266423688"
    mesh.TextureId = "rbxassetid://3266452949"
    mesh.MeshType = Enum.MeshType.FileMesh
    mesh.Parent = blade

    -- Weld instead of Motor6D to prevent animation conflicts
    local weld = Instance.new("Weld")
    weld.Part0 = arm
    weld.Part1 = blade
    weld.C0 = CFrame.new(positionOffset.X, positionOffset.Y, positionOffset.Z) 
        * CFrame.Angles(math.rad(rotation.X), math.rad(rotation.Y), math.rad(rotation.Z))
    weld.Parent = blade

    blade.Parent = character
end

createBlade(
    rightArm, 
    "Blade of Chaos (Right)", 
    Vector3.new(0, -1, -1),
    Vector3.new(0, 90, 0)
)

createBlade(
    leftArm, 
    "Blade of Chaos (Left)", 
    Vector3.new(0, -1, -1),
    Vector3.new(0, 90, 0)
)
-- M1 THINGIES
character:GetAttributeChangedSignal("LastM1Hitted"):Connect(function()
    local M1Fx = ReplicatedStorage.Emotes.VFX.RealAssets.Humiliation.Part.Necksnap:Clone()
    local LastM1Hitted = (character:GetAttribute("LastM1Hitted") or ""):match("^(.-);;") -- dont ask why
    M1Fx.Parent = workspace.Live:FindFirstChild(LastM1Hitted).HumanoidRootPart
    
    for _, child in ipairs(M1Fx:GetChildren()) do
        if child:IsA("ParticleEmitter") then
            child:Emit(15)
            child.Enabled = false
        end
    end
    -- Sounds
    local sounds = {
        "rbxassetid://7441143433",
        "rbxassetid://7441141814",
        "rbxassetid://7441143109",
        "rbxassetid://7441142253",
        "rbxassetid://7441142573",
        "rbxassetid://7441141814",
        "rbxassetid://7441142834"
    }
    local soundId = sounds[math.random(#sounds)]
    local sound = Instance.new("Sound", M1Fx.Parent)
    sound.SoundId = soundId
    sound:Play()
    sound.Stopped:Wait()
    sound:Destroy()
end)
-- END OF M1 THINGIES
local rightBlade = character:FindFirstChild("Blade of Chaos (Right)")
local leftBlade = character:FindFirstChild("Blade of Chaos (Left)")

local function tweenBlade(weld, targetC0)
    if weld then
        local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out) -- 0.3s smooth tween
        local tween = TweenService:Create(weld, tweenInfo, { C0 = targetC0 })
        tween:Play()
    end
end

-- ERM (Change Blade Position)
local function bladePos()
    if rightBlade then
        local weld = rightBlade:FindFirstChildWhichIsA("Weld")
        tweenBlade(weld, CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-90)))
    end

    if leftBlade then
        local weld = leftBlade:FindFirstChildWhichIsA("Weld")
        tweenBlade(weld, CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(-90)))
    end
end

-- ERM 2 (Return Blade to Original Position)
local function returnBladePos()
    if rightBlade then
        local weld = rightBlade:FindFirstChildWhichIsA("Weld")
        tweenBlade(weld, CFrame.new(0, -1, -1) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)))
    end

    if leftBlade then
        local weld = leftBlade:FindFirstChildWhichIsA("Weld")
        tweenBlade(weld, CFrame.new(0, -1, -1) * CFrame.Angles(math.rad(0), math.rad(90), math.rad(0)))
    end
end

-- [[____________________________________________START OF ANIMATIONS____________________________________________]]

-- [[IDLE ANIMATION]]
pcall(function() getgenv().Idle:Disconnect() end)

getgenv().Idle = humanoid.AnimationPlayed:Connect(function(v)
    if v.Animation.AnimationId == "rbxassetid://14516273501" then
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://18450406917"
        local humanoid = game.Players.LocalPlayer.Character.Humanoid
        local k = humanoid:LoadAnimation(Anim)

        k.Priority = Enum.AnimationPriority.Idle
        k.Looped = true
        k:Play(0.3)
        k:AdjustSpeed(0) -- Freeze animation for manual control

        -- Define key points for the loop
        local startTime = 0 -- First keyframe
        local endTime = 0.1   -- Second keyframe
        local cycleDuration = 1.5 -- Time for a full A -> B -> A cycle
        local timeElapsed = 0

        local connection
        connection = RunService.Heartbeat:Connect(function(deltaTime)
            timeElapsed = (timeElapsed + deltaTime) % (cycleDuration * 2) -- Loop time

            local alpha = (math.sin((timeElapsed / cycleDuration) * math.pi - math.pi / 2) + 1) / 2
            k.TimePosition = startTime + (endTime - startTime) * alpha
        end)

        v.Stopped:Wait()
        k:Stop(0.3)
        connection:Disconnect()
    end
end)
-- [[END OF IDLE ANIMATION]]

-- [[WALK ANIMATION]]
pcall(function() getgenv().Movement:Disconnect() end)

getgenv().Movement = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://7807831448" then
        local walkAnimation = Instance.new("Animation")
        walkAnimation.AnimationId = "rbxassetid://15962443652"
        local loadedAnimation = humanoid:LoadAnimation(walkAnimation)

        loadedAnimation.Priority = Enum.AnimationPriority.Movement
        loadedAnimation.Looped = true
        loadedAnimation:Play(0.3)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop(0.3)
    end
end)
-- [[END OF WALK ANIMATION]]

-- [[_____________________________________________M1 ANIMATIONS____________________________________________]]
-- [[M1]]
pcall(function() getgenv().M1:Disconnect() end)

getgenv().M1 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10469493270" then
        local m1Animation = Instance.new("Animation")
        m1Animation.AnimationId = "rbxassetid://16515503507"
        local loadedAnimation = humanoid:LoadAnimation(m1Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        bladePos()
        loadedAnimation:Play()
        
        loadedAnimation:AdjustSpeed(1)

        loadedAnimation.Stopped:Wait()
        returnBladePos()
    end
end)
-- [[M2]]
pcall(function() getgenv().M2:Disconnect() end)

getgenv().M2 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10469630950" then
        local m2Animation = Instance.new("Animation")
        m2Animation.AnimationId = "rbxassetid://16515520431"
        local loadedAnimation = humanoid:LoadAnimation(m2Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        bladePos()
        loadedAnimation:AdjustSpeed(1)

        loadedAnimation.Stopped:Wait()
        returnBladePos()
    end
end)
-- [[M3]]
pcall(function() getgenv().M2:Disconnect() end)

getgenv().M3 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10469639222" then
        local m3Animation = Instance.new("Animation")
        m3Animation.AnimationId = "rbxassetid://16515448089"
        local loadedAnimation = humanoid:LoadAnimation(m3Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        bladePos()
        loadedAnimation:AdjustSpeed(1)

        loadedAnimation.Stopped:Wait()
        returnBladePos()
    end
end)
-- [[M4]]
pcall(function() getgenv().M4:Disconnect() end)

getgenv().M4 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10469643643" then
        local m4Animation = Instance.new("Animation")
        m4Animation.AnimationId = "rbxassetid://15162694192"
        local loadedAnimation = humanoid:LoadAnimation(m4Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        bladePos()
        loadedAnimation:AdjustSpeed(1)

        loadedAnimation.Stopped:Wait()
        returnBladePos()
    end
end)

-- [[WALL COMBO]]
pcall(function() getgenv().WallCombo:Disconnect() end)

getgenv().WallCombo = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://15955393872" then
        local wallcomboAnimation = Instance.new("Animation")
        wallcomboAnimation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(wallcomboAnimation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)

-- [[BLOCK]]
pcall(function() getgenv().Block:Disconnect() end)

getgenv().Block = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10470389827" then
        local blockAnimation = Instance.new("Animation")
        blockAnimation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(blockAnimation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[____________________________________________END OF M1 ANIMATIONS____________________________________________]]

-- [[______________________________________________MOVE ANIMATIONS________________________________________________]]
-- [[MOVE 1]]
pcall(function() getgenv().Move1:Disconnect() end)

getgenv().Move1 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10468665991" then
        local move1Animation = Instance.new("Animation")
        move1Animation.AnimationId = "rbxassetid://140164642047188"
        local loadedAnimation = humanoid:LoadAnimation(move1Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action4
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        bladePos()
        loadedAnimation.TimePosition = 6.8
local tpfx = ReplicatedStorage.Resources.NinjaUlt.Start_Effects.Particles.Low:Clone()
    tpfx.Parent = humanoidRootPart
        for _, child in ipairs(tpfx:GetChildren()) do
            child:Emit(1)
            child.Enabled = false
        end
        loadedAnimation:AdjustSpeed(0.9)
       
        loadedAnimation.Stopped:Wait()
        returnBladePos()
    end
end)
-- [[MOVE 2]]
pcall(function() getgenv().Move2:Disconnect() end)

getgenv().Move2 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10466974800" then
        local move2Animation = Instance.new("Animation")
        move2Animation.AnimationId = "rbxassetid://124337193780872"
        local loadedAnimation = humanoid:LoadAnimation(move2Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action4
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
    character.ChildAdded:Connect(function(c) -- Remove consecutive punches fx
        if c.Name == "BarrageBind" then
            task.wait()
            c:Destroy()
        end
    end)
        loadedAnimation:AdjustSpeed(1.6)
        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[MOVE 3]]
pcall(function() getgenv().Move3:Disconnect() end)

getgenv().Move3 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then
        local move3Animation = Instance.new("Animation")
        move3Animation.AnimationId = "rbxassetid://128022763591042"
        local loadedAnimation = humanoid:LoadAnimation(move3Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action4
        loadedAnimation:AdjustSpeed(0.1)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1.5)
task.delay(.5, function()
local shovefx = ReplicatedStorage.Resources.HammerVfx.FloorFx.Attachment:Clone()
shovefx.Parent = humanoidRootPart

for _, child in ipairs(shovefx:GetChildren()) do
    if child:IsA("ParticleEmitter") then
        child:Emit(15)
        child.Enabled = false
    end
end
end)
    end
end)-- [[MOVE 4]]
pcall(function() getgenv().Move4:Disconnect() end)

getgenv().Move4 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://12510170988" then
        local move4Animation = Instance.new("Animation")
        move4Animation.AnimationId = "rbxassetid://18897119503"
        local loadedAnimation = humanoid:LoadAnimation(move4Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action4
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
local descendantAddedConnection

descAdded = character.DescendantAdded:Connect(function(c) -- No velocity, delete if u dont use saitama
    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BodyVelocity") then
            v.Velocity = Vector3.new()
        end
    end
end)
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
    descAdded:Disconnect()
    end
end)
-- [[____________________________________________END OF MOVE ANIMATIONS____________________________________________]]

-- [[______________________________________________ULT ANIMATIONS________________________________________________]]
-- [[ULT AWAKENING]]
pcall(function() getgenv().UltAwakening:Disconnect() end)

getgenv().UltAwakening = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://12447707844" then
        local ultAnimation = Instance.new("Animation")
        ultAnimation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(ultAnimation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[ULT MOVE 1]]
pcall(function() getgenv().UltMove1:Disconnect() end)

getgenv().UltMove1 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://18715881168" then
        local ult1Animation = Instance.new("Animation")
        ult1Animation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(ult1Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[ULT MOVE 2]]
pcall(function() getgenv().UltMove2:Disconnect() end)

getgenv().UltMove2 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10466974800" then
        local ult2Animation = Instance.new("Animation")
        ult2Animation.AnimationId = "rbxassetid://10466974800"
        local loadedAnimation = humanoid:LoadAnimation(ult2Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[ULT MOVE 3]]
pcall(function() getgenv().UltMove3:Disconnect() end)

getgenv().UltMove3 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://10471336737" then
        local ult3Animation = Instance.new("Animation")
        ult3Animation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(ult3Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
-- [[ULT MOVE 4]]
pcall(function() getgenv().UltMove4:Disconnect() end)

getgenv().UltMove4 = humanoid.AnimationPlayed:Connect(function(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://12510170988" then
        local ult4Animation = Instance.new("Animation")
        ult4Animation.AnimationId = "rbxassetid://15962326593"
        local loadedAnimation = humanoid:LoadAnimation(ult4Animation)

        loadedAnimation.Priority = Enum.AnimationPriority.Action3
        loadedAnimation:AdjustSpeed(0)
        loadedAnimation:Play()
        loadedAnimation:AdjustSpeed(1)

        animationTrack.Stopped:Wait()
        loadedAnimation:Stop()
    end
end)
