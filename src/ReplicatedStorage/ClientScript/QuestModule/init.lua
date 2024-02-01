local Players = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
_G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()

--// Gui frame Quest
local VladislovGui = UI:WaitForChild('QuestVladislov')
local BreadvGui = UI:WaitForChild('QuestBread')
local SnailGui = UI:WaitForChild('QuestSnail')

local QusetModule = {}

function NPCFind(NPC)
    local TypeQuest --// Проверка если квест у игрока

    if not _G.PData.QuestNPC[NPC].Complish then
        TypeQuest = "NewQuset"
    elseif _G.PData.QuestNPC[NPC].Complish and not _G.PData.QuestNPC[NPC].NowQuest then
        TypeQuest = "OldQuset"
    elseif _G.PData.QuestNPC[NPC].Complish and _G.PData.QuestNPC[NPC].NowQuest then
        TypeQuest = "Completed"
    end
    return TypeQuest
end

function QusetModule:GlobuleQuestModule()
    local FolderNPC = Workspace:WaitForChild('QusetNPC')
    local Connection
end

--BreadvGui.ButtonQuest.MouseButton1Click:Connect()
--SnailGui.ButtonQuest.MouseButton1Click:Connect()
--VladislovGui.ButtonQuest.MouseButton1Click:Connect()

return QusetModule