local player = game.Players.LocalPlayer
local ufo = workspace:WaitForChild("UFO")
local beam = ufo:WaitForChild("Beam")

local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
ScreenGui.Name = "UFOGui"

local button = Instance.new("TextButton", ScreenGui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.9, -25)
button.Text = "UFO: OFF"
button.BackgroundColor3 = Color3.fromRGB(30,30,30)
button.TextColor3 = Color3.new(1,1,1)

local ufoOn = false

button.MouseButton1Click:Connect(function()
    ufoOn = not ufoOn
    button.Text = ufoOn and "UFO: ON" or "UFO: OFF"
    if ufoOn then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            ufo:SetPrimaryPartCFrame(CFrame.new(root.Position + Vector3.new(0,10,0)))
            beam.Enabled = true
        end
    else
        beam.Enabled = false
    end
end)
