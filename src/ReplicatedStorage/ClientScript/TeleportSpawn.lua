local Players = game:GetService("Players").LocalPlayer
local TeleportSpawn = {}

local LobbyFolder = workspace.LobbyBorders.PartTeleport

LobbyFolder.Touched:Connect(function(Hit)
    if Hit.Parent == Players.Character then
        if Hit.Parent:FindFirstChild('HumanoidRootPart') then
            Hit.Parent.HumanoidRootPart.CFrame = workspace.Spawn.SpawnLocation.CFrame + Vector3.new(0,3,0)
        end
    end    
end)

return TeleportSpawn