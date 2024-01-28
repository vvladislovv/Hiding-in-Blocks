local Player = game.Players.LocalPlayer
local Char = Player.Character or Player.CharacterAdded:Wait()
local Hum = Char:WaitForChild("Humanoid")

local Camera = game.Workspace.CurrentCamera

local UIS = game:GetService("UserInputService")
local TW = game:GetService("TweenService")
local ConfigTable = {
    RunKey = Enum.KeyCode.LeftShift or Enum.KeyCode.RightShift,
    WalkSpeed = 18,
    RunSpeed = 25,
    WalFov = 80,
    RunFov = 80,
    TFD = 0


}

local RunPlayer = {}

function IsWalking()
    if Hum.MoveDirection.Magnitude > 0 then
        return true
    else
        return false
    end
end


UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == ConfigTable.RunKey then
        if IsWalking then
            Hum.WalkSpeed = ConfigTable.RunSpeed
            TW:Create(Camera, TweenInfo.new(ConfigTable.TFD, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {FieldOfView = ConfigTable.RunFov}):Play()
        end
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == ConfigTable.RunKey then
            Hum.WalkSpeed = ConfigTable.WalkSpeed
            TW:Create(Camera, TweenInfo.new(ConfigTable.TFD, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {FieldOfView = ConfigTable.WalFov}):Play()
    end
end)

return RunPlayer