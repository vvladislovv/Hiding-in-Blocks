local Players = game:GetService("Players").LocalPlayer
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local Remote = game.ReplicatedStorage:WaitForChild("Remote")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local DialogsModuleFolder = require(game.ReplicatedStorage:WaitForChild('ClientScript').QuestModule.DiaolgsNPC)
local NofficalModule = require(game.ReplicatedStorage.ClientScript.Notifical)
local GuiQuset = require(script.Parent.OpenGui)

repeat 
    _G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()
until _G.PData

print(_G.PData)


--// Gui frame Quest
local VladislovGui = UI:WaitForChild('QuestVladislov')
local BreadGui = UI:WaitForChild('QuestBread')
local SnailGui = UI:WaitForChild('QuestSnail')

local QuestModule = {}

function CheckMouse() --* Иконка мышки включить
    local UIS = game:GetService("UserInputService")
    if UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
        UIS.MouseBehavior = Enum.MouseBehavior.Default
        UIS.MouseIconEnabled = true
    end
end

function CameraType(cf,CameraTypee) --* Получение камеры у персонажа
    local TW = game:GetService("TweenService")
    local Camera = game.Workspace.CurrentCamera

    TW:Create(Camera,TweenInfo.new(5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraTypee.CFrame}):Play()
    TW:Create(Camera,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = cf}):Play()
end

function OpenGuiQuest(GuiName)
    TWS:GuiFrameShop(GuiName, 0.5,{Position = UDim2.new(0.337, 0,0.791, 0)}) --* Открытие
end

function CloseGuiQuest(GuiName)
    TWS:GuiFrameShop(GuiName, 1.5,{Position = UDim2.new(0.337, 0,5, 0)}) --* Закрытие
end


function NPCFind(NPC) --* Проверка на каком этапе квес у игрока 
    local TypeQuest 
    if not _G.PData.QuestNPC[NPC].NowQuest then --* Если нет то, нету квеста
        print(_G.PData.QuestNPC[NPC])
        TypeQuest = "NewQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].NowQuest == true and not _G.PData.QuestNPC[NPC].Complish then --* Если есть первое, но нет второго значить в процеессе выполнения
        TypeQuest = "OldQuest"
        print('fff')
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].Complish and _G.PData.QuestNPC[NPC].NowQuest then --* Если то и то тогда конец квеста
        TypeQuest = "Completed"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].QuestEvent then
        TypeQuest = "EventQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif not _G.PData.QuestNPC[NPC].NoQuset then
        TypeQuest = "NoQuset"
        NewQuestNPC(TypeQuest, NPC)
    end
    return TypeQuest
end

function TaskQuset(NPC)
    local QusetInfoModule = DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest]

    for i, v in pairs(QusetInfoModule.Task) do
        if i > 1 then -- ! Gui Need scriptTask
            print(i) -- number
            print(v) -- Task
        end
    end
end


function ButtonClick(Button)
    TWS:BittonClick(Button)
end

function NewQuestNPC(TypeQuest, NPC)
    local Index = 1
    
    if not DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest] then
        print("Not Quset")
        TaskQuset(NPC)
    else
        local DialogsModule = DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest].Dialogs
        TaskQuset(NPC)
        if TypeQuest == 'NewQuest' then
        if NPC == "Bread" then
            if not _G.PData.QuestNPC[NPC].NowQuest then
                _G.PData.QuestNPC[NPC].NowQuest = true
                Remote.QuestRemote:FireServer(NPC)
                OpenGuiQuest(BreadGui)
                --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)

                BreadGui.Frame.TextLabel.Text = DialogsModule.NewQuset[Index]
                BreadGui.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.NewQuset then --// Счет по [1]...
                        GuiQuset:NewQuestGUI(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest])
                        CloseGuiQuest(BreadGui)
                        Index = 1
                        task.wait(0.3)
                        NofficalModule:NewQuest(NPC)
                    else
                        ButtonClick(BreadGui)
                        --print(DialogsModule.NewQuset[Index])
                        BreadGui.Frame.TextLabel.Text = DialogsModule.NewQuset[Index]
                        --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule.NewQuset[Index])
                    end
                end)
                
            end

        end
    elseif TypeQuest == 'OldQuest' then
        if NPC == "Bread" then
            print('OldQuest')
            print(_G.PData.QuestNPC[NPC].NowQuest)
            if _G.PData.QuestNPC[NPC].NowQuest then
                _G.PData.QuestNPC[NPC].NowQuest = true
                _G.PData.QuestNPC[NPC].Complish = true
                OpenGuiQuest(BreadGui)
                BreadGui.Frame.TextLabel.Text = DialogsModule.OldQuset[Index]
                BreadGui.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.OldQuset then --// Счет по [1]...
                        CloseGuiQuest(BreadGui)
                        Index = 1 
                    else
                        ButtonClick(BreadGui)
                        --print(DialogsModule.OldQuset[Index])
                        BreadGui.Frame.TextLabel.Text = DialogsModule.OldQuset[Index]
                        --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule.OldQuset[Index])
                    end
    
                end)
            end
        end
    elseif TypeQuest == 'Completed' then
        if NPC == "Bread" then
            print('OldQuest')
            print(_G.PData.QuestNPC[NPC].Complish)
            Remote.QuestComplish:FireServer(NPC)
                OpenGuiQuest(BreadGui)
                BreadGui.Frame.TextLabel.Text = DialogsModule.Completed[Index]
                BreadGui.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.Completed then --// Счет по [1]...
                        CloseGuiQuest(BreadGui)
                        Index = 1
                    else
                        ButtonClick(BreadGui)
                        BreadGui.Frame.TextLabel.Text = DialogsModule.Completed[Index]
                        --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule.Completed[Index])
                    end
    
                end)
        end
    elseif TypeQuest == 'EventQuest' then
        if NPC == '' then
            print('Event')
        end
    elseif TypeQuest == 'NoQuset' then --// нет квестов
        if NPC == '' then
            print('NoQuset')
            end
        end
    end
end
--[[
function TextPrint(ObjectGui, TimeWrite, DialogsModule)
        for i = 1, #DialogsModule, 1 do
            ObjectGui.Text = string.sub(DialogsModule, 1, i)
        task.wait(TimeWrite) 
    end
end
]]


function QuestModule:QuestGlobule() --// NPC - название персонажа
    local QuestFolder = workspace:WaitForChild('QusetNPC')
    local Camera = game.Workspace.CurrentCamera
    local TW = game:GetService("TweenService")
    local UserInputService = game:GetService('UserInputService')
  --  local QuestTypeNpc = QuestModule:NPCFind(NPC.Name) --// получения квестов от NPC
   -- local DialogsModule = DialogsModuleFolder.QuesetDialog[QuestTypeNpc].QusetTable[_G.PData.QusetNPC[NPC.Name].NowQuest].Dialogs


    for _, Index in next, QuestFolder:GetChildren() do
        print(Index)
        Index.ProximityPrompt.Triggered:Connect(function()
            local NameNPC = Index.Name
            if Index.Name == 'Bread' then -- Index.Camera.Part
                NPCFind(NameNPC)
            elseif Index.Name == 'VladislovNPC' then
                NPCFind(NameNPC)
            elseif Index.Name == 'SnailNPC' then
                NPCFind(NameNPC)
            end
        end)
    end
end

QuestModule:QuestGlobule()

return QuestModule