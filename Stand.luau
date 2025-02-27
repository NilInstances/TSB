if stand and not game.PlaceId = "10449761463" then return end
getgenv().stand = true

local Players = game:GetService("Players")
local Stand = Players.LocalPlayer.Character

local ScreenGui = Instance.new("ScreenGui")
local StandGUI = Instance.new("Frame")
local StandDebug = Instance.new("TextLabel")
local Ver = Instance.new("TextLabel")
local TargetText = Instance.new("TextLabel")
local Elapsed = Instance.new("TextLabel")
local TargetHPText = Instance.new("TextLabel")
local LastCMD = Instance.new("TextLabel")
local TargetHP = Instance.new("TextLabel")
local LastCMDText = Instance.new("TextLabel")
local Targett = Instance.new("TextBox")
local QuickButtons = Instance.new("TextLabel")
local Reset = Instance.new("TextButton")
local ForceTP = Instance.new("TextButton")
local DisconnectButton = Instance.new("TextButton")
local TargetInfo = Instance.new("Frame")
local TargetInfo_2 = Instance.new("TextLabel")
local TargetCharacterText = Instance.new("TextLabel")
local TargetCharacter = Instance.new("TextLabel")
local TargetUltimateText = Instance.new("TextLabel")
local TargetUltimate = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

StandGUI.Name = "StandGUI"
StandGUI.Parent = ScreenGui
StandGUI.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
StandGUI.BorderSizePixel = 2
StandGUI.Position = UDim2.new(0.05, 0, 0.15, 0)
StandGUI.Size = UDim2.new(0.25, 0, 0.5, 0)
StandGUI.ClipsDescendants = true

UICorner.Parent = StandGUI
UICorner.CornerRadius = UDim.new(0, 10)


TargetInfo.Name = "TargetInfo"
TargetInfo.Parent = ScreenGui
TargetInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TargetInfo.BorderSizePixel = 2
TargetInfo.ClipsDescendants = true
TargetInfo.Position = UDim2.new(0.706960857, 0, 0.167114928, 0)
TargetInfo.Size = UDim2.new(0.25, 0, 0.381418079, 0)

UICorner:Clone().Parent = TargetInfo


TargetInfo_2.Name = "TargetInfo"
TargetInfo_2.Parent = TargetInfo
TargetInfo_2.BackgroundTransparency = 1.000
TargetInfo_2.Size = UDim2.new(1, 0, 0.100000001, 0)
TargetInfo_2.Font = Enum.Font.FredokaOne
TargetInfo_2.Text = "Master Info"
TargetInfo_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetInfo_2.TextScaled = true
TargetInfo_2.TextWrapped = true

TargetCharacterText.Name = "TargetCharacterText"
TargetCharacterText.Parent = TargetInfo
TargetCharacterText.BackgroundTransparency = 1.000
TargetCharacterText.Position = UDim2.new(-0.00296723051, 0, 0.150641024, 0)
TargetCharacterText.Size = UDim2.new(0.623076737, 0, 0.0692307651, 0)
TargetCharacterText.Font = Enum.Font.FredokaOne
TargetCharacterText.Text = "Character:"
TargetCharacterText.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetCharacterText.TextScaled = true
TargetCharacterText.TextWrapped = true

TargetCharacter.Name = "TargetCharacter"
TargetCharacter.Parent = TargetInfo
TargetCharacter.BackgroundTransparency = 1.000
TargetCharacter.Position = UDim2.new(0.434486121, 0, 0.150641024, 0)
TargetCharacter.Size = UDim2.new(0.623000026, 0, 0.0689999983, 0)
TargetCharacter.Font = Enum.Font.FredokaOne
TargetCharacter.Text = "Bald"
TargetCharacter.TextColor3 = Color3.fromRGB(255, 96, 96)
TargetCharacter.TextScaled = true
TargetCharacter.TextWrapped = true

TargetUltimateText.Name = "TargetUltimateText"
TargetUltimateText.Parent = TargetInfo
TargetUltimateText.BackgroundTransparency = 1.000
TargetUltimateText.Position = UDim2.new(-0.00296723051, 0, 0.256410271, 0)
TargetUltimateText.Size = UDim2.new(0.623076737, 0, 0.0692307651, 0)
TargetUltimateText.Font = Enum.Font.FredokaOne
TargetUltimateText.Text = "Ultimate %:"
TargetUltimateText.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetUltimateText.TextScaled = true
TargetUltimateText.TextWrapped = true

TargetUltimate.Name = "TargetUltimate"
TargetUltimate.Parent = TargetInfo
TargetUltimate.BackgroundTransparency = 1.000
TargetUltimate.Position = UDim2.new(0.434486121, 0, 0.256410271, 0)
TargetUltimate.Size = UDim2.new(0.623000026, 0, 0.0689999983, 0)
TargetUltimate.Font = Enum.Font.FredokaOne
TargetUltimate.Text = "100%"
TargetUltimate.TextColor3 = Color3.fromRGB(17, 255, 0)
TargetUltimate.TextScaled = true
TargetUltimate.TextWrapped = true

StandDebug.Name = "StandDebug"
StandDebug.Parent = StandGUI
StandDebug.BackgroundTransparency = 1
StandDebug.Size = UDim2.new(1, 0, 0.1, 0)
StandDebug.Font = Enum.Font.FredokaOne
StandDebug.Text = "Stand Debug"
StandDebug.TextColor3 = Color3.fromRGB(255, 255, 255)
StandDebug.TextScaled = true

Ver.Name = "Version"
Ver.Parent = StandGUI
Ver.BackgroundTransparency = 1
Ver.Position = UDim2.new(0, 0, 0.1, 0)
Ver.Size = UDim2.new(1, 0, 0.05, 0)
Ver.Font = Enum.Font.FredokaOne
Ver.Text = "Version: 0.1 (Latest)"
Ver.TextColor3 = Color3.fromRGB(180, 180, 180)
Ver.TextScaled = true

TargetText.Name = "TargetText"
TargetText.Parent = StandGUI
TargetText.BackgroundTransparency = 1
TargetText.Position = UDim2.new(0.05, 0, 0.18, 0)
TargetText.Size = UDim2.new(0.4, 0, 0.05, 0)
TargetText.Font = Enum.Font.FredokaOne
TargetText.Text = "Master:"
TargetText.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetText.TextScaled = true

Targett.Name = "Target"
Targett.Parent = StandGUI
Targett.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Targett.Position = UDim2.new(0.5, 0, 0.18, 0)
Targett.Size = UDim2.new(0.45, 0, 0.05, 0)
Targett.Font = Enum.Font.FredokaOne
Targett.Text = ""
Targett.PlaceholderText = "Input username..."
Targett.TextColor3 = Color3.fromRGB(255, 255, 255)
Targett.TextScaled = true
Targett.TextStrokeTransparency = 0.5

local Target
Targett:GetPropertyChangedSignal("Text"):Connect(function(text)
    if Players:GetPlayers():match(text) then
      Target = text
    end
  end)
UICorner:Clone().Parent = Target

TargetHPText.Name = "TargetHPText"
TargetHPText.Parent = StandGUI
TargetHPText.BackgroundTransparency = 1
TargetHPText.Position = UDim2.new(0.05, 0, 0.25, 0)
TargetHPText.Size = UDim2.new(0.45, 0, 0.05, 0)
TargetHPText.Font = Enum.Font.FredokaOne
TargetHPText.Text = "Health:"
TargetHPText.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetHPText.TextScaled = true

TargetHP.Name = "TargetHP"
TargetHP.Parent = StandGUI
TargetHP.BackgroundTransparency = 1
TargetHP.Position = UDim2.new(0.5, 0, 0.25, 0)
TargetHP.Size = UDim2.new(0.45, 0, 0.05, 0)
TargetHP.Font = Enum.Font.FredokaOne
TargetHP.Text = "100"
TargetHP.TextColor3 = Color3.fromRGB(0, 255, 0)
TargetHP.TextScaled = true

LastCMDText.Name = "LastCMDText"
LastCMDText.Parent = StandGUI
LastCMDText.BackgroundTransparency = 1
LastCMDText.Position = UDim2.new(0.05, 0, 0.35, 0)
LastCMDText.Size = UDim2.new(0.9, 0, 0.05, 0)
LastCMDText.Font = Enum.Font.FredokaOne
LastCMDText.Text = "Last Command:"
LastCMDText.TextColor3 = Color3.fromRGB(255, 255, 255)
LastCMDText.TextScaled = true

LastCMD.Name = "LastCMD"
LastCMD.Parent = StandGUI
LastCMD.BackgroundTransparency = 1
LastCMD.Position = UDim2.new(0.05, 0, 0.4, 0)
LastCMD.Size = UDim2.new(0.9, 0, 0.05, 0)
LastCMD.Font = Enum.Font.FredokaOne
LastCMD.Text = "kill Jotaro"
LastCMD.TextColor3 = Color3.fromRGB(255, 100, 100)
LastCMD.TextScaled = true

Reset.Name = "Reset"
Reset.Parent = StandGUI
Reset.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
Reset.Position = UDim2.new(0.05, 0, 0.5, 0)
Reset.Size = UDim2.new(0.9, 0, 0.07, 0)
Reset.Font = Enum.Font.FredokaOne
Reset.Text = "Reset Stand"
Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
Reset.TextScaled = true

Reset.MouseButton1Click:Connect(function()
	Stand.Humanoid.Health = 0
end)

UICorner:Clone().Parent = Reset

ForceTP.Name = "ForceTP"
ForceTP.Parent = StandGUI
ForceTP.BackgroundColor3 = Color3.fromRGB(50, 100, 50)
ForceTP.Position = UDim2.new(0.05, 0, 0.6, 0)
ForceTP.Size = UDim2.new(0.9, 0, 0.07, 0)
ForceTP.Font = Enum.Font.FredokaOne
ForceTP.Text = "Teleport to Master"
ForceTP.TextColor3 = Color3.fromRGB(255, 255, 255)
ForceTP.TextScaled = true

UICorner:Clone().Parent = ForceTP

DisconnectButton.Name = "DisconnectButton"
DisconnectButton.Parent = StandGUI
DisconnectButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
DisconnectButton.Position = UDim2.new(0.05, 0, 0.7, 0)
DisconnectButton.Size = UDim2.new(0.9, 0, 0.07, 0)
DisconnectButton.Font = Enum.Font.FredokaOne
DisconnectButton.Text = "Disconnect from Master"
DisconnectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DisconnectButton.TextScaled = true

UICorner:Clone().Parent = DisconnectButton

local connected = true

DisconnectButton.MouseButton1Click:Connect(function()
	connected = not connected
	if connected then
		DisconnectButton.Text = "Disconnect from Master"
		DisconnectButton.BackgroundColor3 = Color3.fromRGB(100, 50, 50)
		-- add functionality to reconnect here
	else
		DisconnectButton.Text = "Connect to Master"
		DisconnectButton.BackgroundColor3 = Color3.fromRGB(50, 100, 50)
		-- add functionality to disconnect here
	end
end)

Elapsed.Name = "Elapsed"
Elapsed.Parent = StandGUI
Elapsed.BackgroundTransparency = 1
Elapsed.Position = UDim2.new(0.05, 0, 0.9, 0)
Elapsed.Size = UDim2.new(0.9, 0, 0.05, 0)
Elapsed.Text = "Time Elapsed: 00:00:00"
Elapsed.Font = Enum.Font.FredokaOne
Elapsed.TextColor3 = Color3.fromRGB(180, 180, 180)
Elapsed.TextScaled = true

local elapsed = 0

while task.wait(1) do
	elapsed += 1
	local hours = math.floor(elapsed / 3600)
	local minutes = math.floor((elapsed % 3600) / 60)
	local seconds = elapsed % 60
	local formattedTime = string.format("%02d:%02d:%02d", hours, minutes, seconds)

	Elapsed.Text = ("Time Elapsed: "..formattedTime)
end
