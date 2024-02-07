local Remote = game.ReplicatedStorage:WaitForChild('Remote')
local Data = require(script.Parent.Data)

local RemoteEventModule = {}

Remote.GetToken.OnServerEvent:Connect(function(plr, ItemsSetItems)
    local PData = Data:Get(plr)
    PData.Inventory = ItemsSetItems

end)


return RemoteEventModule