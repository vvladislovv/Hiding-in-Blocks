local UserInputService = game:GetService("UserInputService")
local QuestGui = {}

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild('PlayerGui')
local Quest = PlayerGui:WaitForChild('UI').Quest
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)

local QusetFram = PlayerGui:WaitForChild('UI').QusetFrame
local CloseButton = QusetFram.CloseFrame.TextButton
local Quester = false

Quest.FrameQuest.Button.MouseButton1Click:Connect(function()
    if not Quester then
        TWS:PrinalSettings(QusetFram,1,{Position = UDim2.new(0.201, 0,0.095, 0)})
        Quester =  true
    elseif  Quester then
        TWS:PrinalSettings(QusetFram,1,{Position = UDim2.new(0.201, 0,3, 0)})
        Quester =  false
    end
end)--// Открыть квесты


CloseButton.MouseButton1Click:Connect(function()
    TWS:PrinalSettings(QusetFram,1,{Position = UDim2.new(0.201, 0,3, 0)})
    Quester =  false
end) --// Закрыть квесты

function QusetOpenGui()
    local QuestFolder = workspace.QusetNPC
    local UI = PlayerGui:WaitForChild('UI')
    local Camera = game.Workspace.CurrentCamera
    local TW = game:GetService("TweenService")
    local UserInputService = game:GetService('UserInputService')

    local QuestSnail = UI.QuestSnail
    local QuestVladislov = UI.QuestVladislov
    local QuestBread = UI.QuestBread

    local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)

    for _, Index in next, QuestFolder:GetChildren() do
        print(Index)
        Index.ProximityPrompt.Triggered:Connect(function()
            if Index.Name == 'BreadNpc' then -- Index.Camera.Part
                TWS:GuiFrameShop(QuestBread, 1.5,{Position = UDim2.new(0.337, 0,0.791, 0)})
                Camera.CameraType = Enum.CameraType.Scriptable
                if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                    UserInputService.MouseIconEnabled = true 
                end
                local cf = Index.Camera.Part.CFrame
                TW:Create(workspace.CurrentCamera,TweenInfo.new(5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = Index.Camera.Part.CFrame}):Play()
                TW:Create(Camera,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = cf}):Play()

            elseif Index.Name == 'VladislovNPC' then
                TWS:GuiFrameShop(QuestVladislov, 1,{Position = UDim2.new(0.337, 0,0.791, 0)})
                Camera.CameraType = Enum.CameraType.Scriptable
                local cf = Index.Camera.Part.CFrame
                if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                    UserInputService.MouseIconEnabled = true 
                end
                TW:Create(workspace.CurrentCamera,TweenInfo.new(5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = Index.Camera.Part.CFrame}):Play()
                TW:Create(Camera,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = cf}):Play()

            elseif Index.Name == 'SnailNPC' then
                TWS:GuiFrameShop(QuestSnail, 1,{Position = UDim2.new(0.337, 0,0.791, 0)})
                Camera.CameraType = Enum.CameraType.Scriptable
                local cf = Index.Camera.Part.CFrame
                if UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter then
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                    UserInputService.MouseIconEnabled = true 
                end
                TW:Create(workspace.CurrentCamera,TweenInfo.new(5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = Index.Camera.Part.CFrame}):Play()
                TW:Create(Camera,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = cf}):Play()

            end
        end)
    end
end

QusetOpenGui()

return QuestGui