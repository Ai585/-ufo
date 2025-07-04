local player = game.Players.LocalPlayer
local ufo = workspace:WaitForChild("UFO")
local beam = ufo:WaitForChild("Beam")

local RunService = game:GetService("RunService")

local active = false

-- GUI 생성
local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "UFOGui"

local button = Instance.new("TextButton", ScreenGui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.9, -25)
button.Text = "UFO: OFF"
button.BackgroundColor3 = Color3.fromRGB(30,30,30)
button.TextColor3 = Color3.new(1,1,1)

button.MouseButton1Click:Connect(function()
    active = not active
    button.Text = active and "UFO: ON" or "UFO: OFF"
end)

RunService.Heartbeat:Connect(function()
    if active then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            beam.CFrame = CFrame.new(root.Position + Vector3.new(0,10,0))
            beam.Transparency = 0
        end
    else
        beam.Transparency = 1
    end
end)
