local Mouse = {}
local UserInputService = game:GetService("UserInputService")
local Camera = game.Workspace.CurrentCamera
local OffMouse = false

UserInputService.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton2 and OffMouse == false then
		UserInputService.MouseIconEnabled = false
		UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
		Camera.CameraType = Enum.CameraType.Track
		OffMouse = true
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 and OffMouse == true then
		UserInputService.MouseIconEnabled = true
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		Camera.CameraType = Enum.CameraType.Custom
		OffMouse = false
	end
end)


return Mouse