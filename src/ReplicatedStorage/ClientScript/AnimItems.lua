local AnimItems = {}

local RunService = game:GetService("RunService")
local CoinFolder = game.Workspace:WaitForChild('RandomToken')
local RS = game:GetService("ReplicatedStorage")
local TW = game:GetService('TweenService')

RunService.RenderStepped:Connect(function()
    for _, Index in next, CoinFolder:GetChildren() do
        Index.coinClone.CFrame = Index.coinClone.CFrame * CFrame.new(0, math.sin(time() * 3)/20, 0) * CFrame.Angles(0, math.rad(1), 0)
    end
end)

RS:WaitForChild('Remote').TokenClientAnim.OnClientEvent:Connect(function(Coint)
    TW:Create(Coint,TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 1}):Play() 
end)

RS:WaitForChild('Remote').TokenClientAnimTwo.OnClientEvent:Connect(function(Coint)
    TW:Create(Coint,TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Transparency = 0}):Play() 
end)



return AnimItems