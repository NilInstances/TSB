local library = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()

local w1 = library:Window("Ari's TP UI") -- Text

    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local function teleportToPosition(position)
        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
        end
    end
w1:Button(
    "Baseplate",
    function()
        teleportToPosition(Vector3.new(1085, 406, 22964))
    end
)

w1:Button(
    "Under Baseplate",
    function()
        teleportToPosition(Vector3.new(1085, 20, 22984))
    end
)


w1:Button(
    "Death Counter",
    function()
        teleportToPosition(Vector3.new(-63, 29, 20337))
    end
)

w1:Button(
    "Atoms",
    function()
        teleportToPosition(Vector3.new(1065, 131, 23008))
    end
)

w1:Button(
    "Middle",
    function()
        teleportToPosition(Vector3.new(131, 441, -13))
    end
)

w1:Button(
    "Arena",
    function()
        teleportToPosition(Vector3.new(-205, 440, -403))
    end
)
w1:Button(
    "Mountain 1",
    function()
        teleportToPosition(Vector3.new(327, 671, 455))
    end
)

w1:Button(
    "Mountain 2",
    function()
        teleportToPosition(Vector3.new(-8, 653, -387))
    end
)

w1:Button(
    "Jail",
    function()
        teleportToPosition(Vector3.new(439, 440, -376))
    end
)

w1:Button(
    "Smaller Jail",
    function()
        teleportToPosition(Vector3.new(20, 440, -460))
    end
)
