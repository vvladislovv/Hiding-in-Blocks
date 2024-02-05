local Tween = {}

local TweenService = game:GetService("TweenService")

function Tween:CreateTween(NameItems, Timer, HaracterItems)
    TweenService:Create(NameItems,TweenInfo.new(Timer, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1), HaracterItems):Play()
end

function Tween:CreateCamera(Camera1,Camera2, Time)
    local Camera = game.Workspace.CurrentCamera
    Camera.CameraType = Enum.CameraType.Scriptable
    Camera.CFrame = Camera1.CFrame

    TweenService:Create(Camera,TweenInfo.new(Time, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = Camera2.CFrame}):Play()
    task.wait(3)
end

function Tween:PrinalSettings(GuiName,Timer,Position)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:GuiFrameShop(GuiName, Timer, Position)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:GuiLeaderboard(GuiName, Position, Timer)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:BittonClick(NPCMenu)--// Делает как будто нажатие
        NPCMenu:TweenPosition(UDim2.new(0.337, 0,0.75, 0), "Out", "Back", 0.075, true)
		NPCMenu:TweenSize(UDim2.new(0.363, 0,0.247, 0), "Out", "Back", 0.3, true)
		task.wait(0.1)
		NPCMenu:TweenSize(UDim2.new(0.35, 0,0.252, 0), "Out", "Back", 0.3, true)
		NPCMenu:TweenPosition(UDim2.new(0.337, 0,0.75, 0), "Out", "Back", 0.075, true)
end

return Tween