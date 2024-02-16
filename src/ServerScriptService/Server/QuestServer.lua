local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild('Remote')
local DataSave = require(script.Parent.Data)
local Diologs = require(game.ReplicatedStorage.ClientScript.QuestModule.DiaolgsNPC).QuesetDialog
local Utils = require(game.ReplicatedStorage.Libary.Utils)

local QuestServer = {}

Remote.QuestRemote.OnServerEvent:Connect(function(plr, NPC)
    local PData = DataSave:Get(plr)
    print(plr)
    if NPC == 'Bread' then
        PData.QuestTaskNPC[NPC] = Utils:DeepCopy(Diologs[NPC].QusetTable[PData.QuestNPC[NPC].TotalQuest].Task)
        CheckQuset(plr, PData)
        print(PData.QuestTaskNPC[NPC])
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    elseif NPC == 'VladislovNPC' then
        PData.QuestTaskNPC[NPC] = Utils:DeepCopy(Diologs[NPC].QusetTable[PData.QuestNPC[NPC].TotalQuest].Task)
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    
    elseif NPC == 'SnailNPC' then
        PData.QuestTaskNPC[NPC] = Utils:DeepCopy(Diologs[NPC].QusetTable[PData.QuestNPC[NPC].TotalQuest].Task)
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    end
end)

Remote.QuestComplish.OnServerEvent:Connect(function(plr, NPC)
    local PData = DataSave:Get(plr)
    print(plr)
    if NPC == 'Bread' then
        PData.QuestNPC[NPC].Complish = false
        PData.QuestNPC[NPC].NowQuest = false
        PData.QuestNPC[NPC].TotalQuest += 1
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
    elseif NPC == 'VladislovNPC' then
        PData.QuestNPC[NPC].Complish = false
        PData.QuestNPC[NPC].NowQuest = false
        PData.QuestNPC[NPC].TotalQuest += 1
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    
    elseif NPC == 'SnailNPC' then
        PData.QuestNPC[NPC].Complish = false
        PData.QuestNPC[NPC].NowQuest = false
        PData.QuestNPC[NPC].TotalQuest += 1
        PData:Update('QuestNPC', PData.QuestNPC)
        PData:Update('QuestTaskNPC', PData.QuestTaskNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    end
end)

function CheckQuset(Player, PData)
    task.spawn(function()
        while Player do task.wait(1)
            for NpcName, NPC in pairs(PData.QuestTaskNPC) do
                for _, Task in pairs(NPC) do
                    --print(PData.QuestTaskNPC)
                   -- print(Task)
                    local GetStarter = Utils:GetTableNum(NPC, "StartAmt")
                    local GetNeeds = Utils:GetTableNum(NPC, "NeedAmt")
                    if GetStarter >= GetNeeds and PData.QuestNPC[NpcName].Complish == false then
                        PData.QuestNPC[NpcName].Complish = true
                        PData:Update('QuestNPC', PData.QuestNPC)
                    end
                end
            end
        end
    end)    
end


return QuestServer