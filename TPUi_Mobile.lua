local l = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local lp = game:GetService("Players").LocalPlayer

    local function t(p)
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            lp.Character.HumanoidRootPart.CFrame = CFrame.new(p)
        end
    end

local w = l:NewWindow("Ari's TP Ui")

local s = w:NewSection("Click me")
 
s:CreateButton("Baseplate", function()
t(Vector3.new(1085,406,22964))
end)

s:CreateButton("Under Baseplate", function()
t(Vector3.new(1085, 20, 22984))
end)

s:CreateButton("Death Counter", function()
t(Vector3.new(-63, 29, 20337))
end)

s:CreateButton("Atoms", function()
t(Vector3.new(1065,131,23008))
end)

s:CreateButton("Middle", function()
t(Vector3.new(131, 441, -13))
end)

s:CreateButton("Arena", function()
t(Vector3.new(-205, 440, -403))
end)

s:CreateButton("Mountain 1", function()
t(Vector3.new(327, 671, 455))
end)

s:CreateButton("Mountain 2", function()
t(Vector3.new(-8, 653, -387))
end)

s:CreateButton("Jail", function()
t(Vector3.new(439, 440, -376))
end)

s:CreateButton("Smaller Jail", function()
t(Vector3.new(20, 440, -460))
end)
