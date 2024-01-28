local PlatformClient = {}

local Remote = game.ReplicatedStorage:WaitForChild('Remote')

Remote.ColorRemote.OnClientEvent:Connect(function(Object, color)
    Object.Color = color
end)

return PlatformClient