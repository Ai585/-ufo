local player=game.Players.LocalPlayer
local RunService=game:GetService("RunService")
local UserInputService=game:GetService("UserInputService")

local active=false
local guiVisible=true

local ufo=workspace:WaitForChild("UFO")
local originalBeam=ufo:WaitForChild("Beam")
local beam=originalBeam:Clone()
beam.Name="LocalBeamCopy"
beam.Anchored=true
beam.CanCollide=false
beam.Parent=workspace
beam.Transparency=1

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="BeamGui"

local button=Instance.new("TextButton")
button.Size=UDim2.new(0,160,0,50)
button.Position=UDim2.new(0.5,-80,0.9,-25)
button.Text="Beam: OFF"
button.BackgroundColor3=Color3.fromRGB(0,120,0)
button.TextColor3=Color3.new(1,1,1)
button.TextScaled=true
button.Draggable=true
button.Active=true
button.Parent=gui

button.MouseButton1Click:Connect(function()
	active=not active
	button.Text=active and"Beam: ON"or"Beam: OFF"
	beam.Transparency=active and 0 or 1
end)

UserInputService.InputBegan:Connect(function(input,gpe)
	if gpe then return end
	if input.KeyCode==Enum.KeyCode.RightShift then
		guiVisible=not guiVisible
		gui.Enabled=guiVisible
	end
end)

RunService.Heartbeat:Connect(function()
	if active and player.Character then
		local root=player.Character:FindFirstChild("HumanoidRootPart")
		if root then
			beam.CFrame=CFrame.new(root.Position+Vector3.new(0,5,0))
		end
	end
end)
