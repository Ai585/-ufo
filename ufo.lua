local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local ufo = workspace:WaitForChild("UFO")
local beam = ufo:WaitForChild("Beam")

local active = false
local guiVisible = true

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UFOGui"
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.9, -25)
button.Text = "Laser: OFF"
button.BackgroundColor3 = Color3.fromRGB(30,30,30)
button.TextColor3 = Color3.new(1,1,1)
button.Active = true
button.Draggable = true
button.Parent = ScreenGui

button.MouseButton1Click:Connect(function()
    active = not active
    button.Text = active and "Laser: ON" or "Laser: OFF"
    beam.Transparency = active and 0 or 1
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        guiVisible = not guiVisible
        ScreenGui.Enabled = guiVisible
    end
end)

RunService.Heartbeat:Connect(function()
    if active then
        local character = player.Character
        if character then
            local root = character:FindFirstChild("HumanoidRootPart")
            if root then
                beam.CFrame = CFrame.new(root.Position + Vector3.new(0,5,0))
                beam.Transparency = 0
            else
                beam.Transparency = 1
            end
        else
            beam.Transparency = 1
        end
    else
        beam.Transparency = 1
    end
end)
