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

function Tween:MenuTokenPosition(GuiName,Timer,Position)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:GuiFrameShop(GuiName, Timer, Position)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:GuiLeaderboard(GuiName, Position, Timer)
    TweenService:Create(GuiName,TweenInfo.new(Timer, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), Position):Play()
end

function Tween:NofficallOpen(NoficallFrame)
    NoficallFrame:TweenPosition(UDim2.new(0.719, 0,0.76, 0), "InOut", "Linear",1.3)
end

function Tween:NofficallClose(NoficallFrame)
    TweenService:Create(NoficallFrame,TweenInfo.new(1.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play()
    NoficallFrame:TweenPosition(UDim2.new(0.792, 0,2, 0), "InOut", "Linear", 1.3)
end

function Tween:BittonClick(NPCMenu)--// Делает как будто нажатие
    NPCMenu:TweenPosition(UDim2.new(0.49, 0,0.655, 0), "Out", "Back", 0.075, true)
    NPCMenu:TweenSize(UDim2.new(0, 761,0, 446), "Out", "Back", 0.3, true)
    task.wait(0.1)
    NPCMenu:TweenSize(UDim2.new(0, 741,0, 426), "Out", "Back", 0.3, true)
    NPCMenu:TweenPosition(UDim2.new(0.49, 0,0.655, 0), "Out", "Back", 0.075, true)
end

return Tween