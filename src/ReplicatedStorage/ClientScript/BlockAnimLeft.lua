local AnimBlock = {}

local FlyingBlocksFolder = workspace.FlyingBlocks
local TweenService = game:GetService("TweenService") 
local TweenModule = require(game:GetService('ReplicatedStorage').Libary.TweenService)

for _, Index in next, FlyingBlocksFolder:GetChildren() do
    --TweenService:Create(Index,TweenInfo.new(100, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, false), {Orientation = Vector3.new(0,-360,0)}):Play()
    TweenModule:CreateTween(Index, 250, {Orientation = Vector3.new(Index.Orientation.X,-360,Index.Orientation.Z)})

end

return AnimBlock