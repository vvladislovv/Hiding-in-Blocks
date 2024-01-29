local Players = game:GetService("Players")
local GuiTextLabel = {}

    
local Leaderbord = workspace.Leadebord:WaitForChild('SceedBorad')
local Player = game.Players.LocalPlayer
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local PlayerGui = Player:WaitForChild('PlayerGui')
local Remote = game.ReplicatedStorage:WaitForChild('Remote')
local UI = PlayerGui:WaitForChild('UI')
local GuiLeaderboard = UI.GuiLeaderboard

repeat _G.PData = Remote.GetDataSave:InvokeServer() task.wait(0.1) until _G.PData

local NamePlatformTable = {
    ['KillBoard'] = {},
    ['SnelikBoard'] = {},
    ['QuestBoard'] = {},
    ['TokenBoard'] = {}
}

local GuiOpen = false

for _, Index in next, Leaderbord:GetChildren() do
    Index.Platform.Touched:Connect(function(Hit)
        if Hit.Parent == Player.Character then
            if Index.Name == 'KillBoard' then
                TWS:GuiLeaderboard(GuiLeaderboard,{Position = UDim2.new(0.436, 0,0.933, 0)},1)
                GuiLeaderboard.TextLabel.Text = "You did ".._G.PData.BaseSettings.Sneliki.." Hyder Total"
                task.wait(0.1)
                GuiOpen = true
            elseif Index.Name == 'SnelikBoard' then
                TWS:GuiLeaderboard(GuiLeaderboard,{Position = UDim2.new(0.436, 0,0.933, 0)},1)
                GuiLeaderboard.TextLabel.Text = "You did ".._G.PData.BaseSettings.Sneliki.." Sneliki Total"
                task.wait(0.1)
                GuiOpen = true
            elseif Index.Name == 'QuestBoard' then
                TWS:GuiLeaderboard(GuiLeaderboard,{Position = UDim2.new(0.436, 0,0.933, 0)},1)
                GuiLeaderboard.TextLabel.Text = "You did ".._G.PData.BaseSettings.QuestAll.." Quset Total"
                task.wait(0.1)
                GuiOpen = true
            elseif Index.Name == 'TokenBoard' then
                TWS:GuiLeaderboard(GuiLeaderboard,{Position = UDim2.new(0.436, 0,0.933, 0)},1)
                GuiLeaderboard.TextLabel.Text = "You did ".._G.PData.BaseSettings.CollectPassToken.." Token Total"
                task.wait(0.1)
                GuiOpen = true
            end
            --// надо дописать(Посмотреть как сделали в бж)
        end
    end)
    Index.Platform.TouchEnded:Connect(function(Hit)
        if Hit.Parent == Player.Character and GuiOpen then
            TWS:GuiLeaderboard(GuiLeaderboard,{Position = UDim2.new(0.436, 0,4, 0)},3)
        end
    end)
end

return GuiTextLabel