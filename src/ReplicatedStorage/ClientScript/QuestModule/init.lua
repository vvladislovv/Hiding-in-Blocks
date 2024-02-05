local Players = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local DialogsModuleFolder = require(game.ReplicatedStorage:WaitForChild('ClientScript').QuestModule.DiaolgsNPC)

_G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()


--// Gui frame Quest
local VladislovGui = UI:WaitForChild('QuestVladislov')
local BreadGui = UI:WaitForChild('QuestBread')
local SnailGui = UI:WaitForChild('QuestSnail')

local QuestModule = {}

function CheckMouse() --// Иконка мышки включить
    local UIS = game:GetService("UserInputService")
    if UIS.MouseBehavior == Enum.MouseBehavior.LockCenter then
        UIS.MouseBehavior = Enum.MouseBehavior.Default
        UIS.MouseIconEnabled = true
    end
end

function CameraType(cf,CameraTypee) --// Получение камеры у персонажа
    local TW = game:GetService("TweenService")
    local Camera = game.Workspace.CurrentCamera

    TW:Create(Camera,TweenInfo.new(5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraTypee.CFrame}):Play()
    TW:Create(Camera,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = cf}):Play()
end

function OpenGuiQuest(GuiName)
    TWS:GuiFrameShop(GuiName, 0.5,{Position = UDim2.new(0.337, 0,0.791, 0)}) --// Открытие
end

function CloseGuiQuest(GuiName)
    TWS:GuiFrameShop(GuiName, 1.5,{Position = UDim2.new(0.337, 0,5, 0)}) --// Закрытие
end


function NPCFind(NPC) --// Проверка на каком этапе квес у игрока 
    local TypeQuest 
    if not _G.PData.QuestNPC[NPC].Complish then --// Если нет то, нету квеста
        TypeQuest = "NewQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].Complish and not _G.PData.QuestNPC[NPC].NowQuest then --// Если есть первое, но нет второго значить в процеессе выполнения
        TypeQuest = "OldQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].Complish and _G.PData.QuestNPC[NPC].NowQuest then --// Если то и то тогда конец квеста
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

function ButtonClick(Button)
    TWS:BittonClick(Button)
end

function NewQuestNPC(TypeQuest, NPC)
    local DialogsModule = DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].NumberQuest].Dialogs
    local Index = 1
    if TypeQuest == 'NewQuest' then
        if NPC == "Bread" then
            if not _G.PData.QuestNPC[NPC].NowQuest then
                print(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].NumberQuest])
                OpenGuiQuest(BreadGui)
                --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)

                if BreadGui.Frame.TextLabel.Text == "" and Index == 1 then --// Проверка на первый индекс
                    TextPrint(BreadGui.Frame.TextLabel, 0.15, DialogsModule.NewQuset[Index])
                end

                BreadGui.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.NewQuset then --// Счет по [1]...
                        CloseGuiQuest(BreadGui)
                        --// передача ивента на север
                        Index = 1 --// Поменять на OldQuest
                    else
                        ButtonClick(BreadGui)
                        print(DialogsModule.NewQuset[Index])
                        TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule.NewQuset[Index])
                    end
                end)
            end

        end
    elseif TypeQuest == 'OldQuest' then
        print('aaa')
    elseif TypeQuest == 'Completed' then
        print('fff')
    elseif TypeQuest == 'EventQuest' then
        print('fff')
    elseif TypeQuest == 'NoQuset' then --// нет квестов
        print('NoQuset')
    end
end

function TextPrint(ObjectGui, TimeWrite, DialogsModule)
            for i = 1, #DialogsModule, 1 do
                ObjectGui.Text = string.sub(DialogsModule, 1, i)
            task.wait(TimeWrite) 
        end
end



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
                if not _G.PData.QuestNPC[NameNPC].NowQuest then --// Проверка если квест у этого NPC
                    NPCFind(NameNPC)
                else
                    
                end

            elseif Index.Name == 'VladislovNPC' then
                

            elseif Index.Name == 'SnailNPC' then
                
            end
        end)
    end
end

QuestModule:QuestGlobule()
--BreadvGui.ButtonQuest.MouseButton1Click:Connect()
--SnailGui.ButtonQuest.MouseButton1Click:Connect()
--VladislovGui.ButtonQuest.MouseButton1Click:Connect()


--[[
    local QuestSnail = UI.QuestSnail
    local QuestVladislov = UI.QuestVladislov
    local QuestBread = UI.QuestBread
    ]]
return QuestModule