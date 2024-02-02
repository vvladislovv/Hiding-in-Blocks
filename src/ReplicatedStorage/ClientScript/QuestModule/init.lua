local Players = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local DialogsModuleFolder = require(game.ReplicatedStorage.ClientScript.QuestModule.DiaolgsNPC)

_G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()


--// Gui frame Quest
local VladislovGui = UI:WaitForChild('QuestVladislov')
local BreadvGui = UI:WaitForChild('QuestBread')
local SnailGui = UI:WaitForChild('QuestSnail')

local QuestModule = {}

function QuestModule:NPCFind(NPC) --// Проверка на каком этапе квес у игрока 
    local TypeQuest 

    if not _G.PData.QuestNPC[NPC].Complish then --// Если нет то, нету квеста
        TypeQuest = "NewQuest"
    elseif _G.PData.QuestNPC[NPC].Complish and not _G.PData.QuestNPC[NPC].NowQuest then --// Если есть первое, но нет второго значить в процеессе выполнения
        TypeQuest = "OldQuest"
    elseif _G.PData.QuestNPC[NPC].Complish and _G.PData.QuestNPC[NPC].NowQuest then --// Если то и то тогда конец квеста
        TypeQuest = "Completed"
    end
    return TypeQuest
end




function QuestModule:QuestGlobule(NPC) --// NPC - название персонажа
    local QuestFolder = workspace.QuestNPC
    local Camera = game.Workspace.CurrentCamera
    local TW = game:GetService("TweenService")
    local UserInputService = game:GetService('UserInputService')
    local QuestTypeNpc = QuestModule:NPCFind(NPC.Name) --// получения квестов от NPC
    local DialogsModule = DialogsModuleFolder.QuesetDialog[QuestTypeNpc].QusetTable[_G.PData.QusetNPC[NPC.Name].NowQuest].Dialogs


    for _, Index in next, QuestFolder:GetChildren() do
        Index.ProximityPrompt.Triggered:Connect(function()
            if Index.Name == 'Bread' then -- Index.Camera.Part
                if not _G.PData.QuestNPC[Index.Name].NowQuest then --// Проверка если квест у этого NPC
                    --// хуй знает 
                else
                    
                end

            elseif Index.Name == 'VladislovNPC' then
                

            elseif Index.Name == 'SnailNPC' then
                
            end
        end)
    end
end

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
    TWS:GuiFrameShop(GuiName, 1.5,{Position = UDim2.new(0.337, 0,0.791, 0)}) --// Открытие
    TWS:GuiFrameShop(GuiName, 1.5,{Position = UDim2.new(0.337, 0,0.791, 0)}) --// Закрытие
end

--BreadvGui.ButtonQuest.MouseButton1Click:Connect()
--SnailGui.ButtonQuest.MouseButton1Click:Connect()
--VladislovGui.ButtonQuest.MouseButton1Click:Connect()


--[[
    local QuestSnail = UI.QuestSnail
    local QuestVladislov = UI.QuestVladislov
    local QuestBread = UI.QuestBread
    ]]
return QuestModule