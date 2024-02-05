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


return QuestGui