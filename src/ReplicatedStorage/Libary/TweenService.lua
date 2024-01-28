local Tween = {}

function Tween:CreateTween(NameItems, Timer, HaracterItems)
    local TweenService = game:GetService("TweenService")
    TweenService:Create(NameItems,TweenInfo.new(Timer, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1), HaracterItems):Play()

end

return Tween