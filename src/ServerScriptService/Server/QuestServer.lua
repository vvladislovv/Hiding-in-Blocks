local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild('Remote')
local DataSave = require(script.Parent.Data)

local QuestServer = {}

Remote.QuestRemote.OnServerEvent:Connect(function(plr, NPC)
    local PData = DataSave:Get(plr)
    print(plr)
    if NPC == 'Bread' then
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    elseif NPC == 'VladislovNPC' then
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    
    elseif NPC == 'SnailNPC' then
        PData.QuestNPC[NPC].NowQuest = true
        PData:Update('QuestNPC', PData.QuestNPC)
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
    elseif NPC == 'VladislovNPC' then
        PData.QuestNPC[NPC].Complish = false
        PData.QuestNPC[NPC].NowQuest = false
        PData.QuestNPC[NPC].TotalQuest += 1
        PData:Update('QuestNPC', PData.QuestNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    
    elseif NPC == 'SnailNPC' then
        PData.QuestNPC[NPC].Complish = false
        PData.QuestNPC[NPC].NowQuest = false
        PData.QuestNPC[NPC].TotalQuest += 1
        PData:Update('QuestNPC', PData.QuestNPC)
        print(PData.QuestNPC[NPC].NowQuest)
    end
end)

return QuestServer