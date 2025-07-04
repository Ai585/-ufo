local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local ufo = workspace:WaitForChild("UFO")
local originalBeam = ufo:WaitForChild("Beam")

-- 레이저 복사본 만들기
local beam = originalBeam:Clone()
beam.Name = "LocalBeamCopy"
beam.Anchored = true
beam.CanCollide = false
beam.Parent = workspace
beam.Transparency = 1  -- 처음엔 숨김

local active = false

-- GUI 생성
local gui = Instance.new("ScreenGui", game.CoreGui)
local button = Instance.new("TextButton", gui)
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(0.5, -75, 0.9, -25)
button.Text = "Beam: OFF"
button.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
button.TextColor3 = Color3.new(1,1,1)
button.Parent = gui

button.MouseButton1Click:Connect(function()
	active = not active
	button.Text = active and "Beam: ON" or "Beam: OFF"
	beam.Transparency = active and 0 or 1
end)

RunService.Heartbeat:Connect(function()
	if active and player.Character then
		local root = player.Character:FindFirstChild("HumanoidRootPart")
		if root then
			beam.CFrame = CFrame.new(root.Position + Vector3.new(0, 5, 0))
		end
	end
end)
