local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local active = false

local beam = Instance.new("Part")
beam.Name = "Beam"
beam.Size = Vector3.new(1, 0.2, 1)
beam.BrickColor = BrickColor.new("Bright green")
beam.Anchored = true
beam.CanCollide = false
beam.Transparency = 1
beam.Parent = workspace

local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "UFOGui"

local button = Instance.new("TextButton", ScreenGui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.9, -25)
button.Text = "Beam: OFF"
button.BackgroundColor3 = Color3.fromRGB(30,30,30)
button.TextColor3 = Color3.new(1,1,1)

button.MouseButton1Click:Connect(function()
    active = not active
    button.Text = active and "Beam: ON" or "Beam: OFF"
    beam.Transparency = active and 0 or 1
end)

RunService.Heartbeat:Connect(function()
    if active then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            beam.CFrame = CFrame.new(root.Position + Vector3.new(0,10,0))
        end
    end
end)
