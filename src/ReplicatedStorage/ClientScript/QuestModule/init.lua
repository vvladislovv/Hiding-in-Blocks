local Players = game:GetService("Players").LocalPlayer
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local Remote = game.ReplicatedStorage:WaitForChild("Remote")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local DialogsModuleFolder = require(game.ReplicatedStorage:WaitForChild('ClientScript').QuestModule.DiaolgsNPC)
local NofficalModule = require(game.ReplicatedStorage.ClientScript.Notifical)
local GuiQuset = require(script.Parent.OpenGui)
local FrameQuset = game:GetService('ReplicatedStorage').Assert.QusetFrame.FrameQuset  -- QusetFrame in Gui Task

repeat 
    _G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()
until _G.PData

print(_G.PData)

--// Gui frame Quest

local QuestFrame = UI:WaitForChild('QuestFrame')

--[[
local VladislovGui = UI:WaitForChild('QuestVladislov')
local BreadGui = UI:WaitForChild('QuestBread')
local SnailGui = UI:WaitForChild('QuestSnail')
]]
local QuestModule = {}

QuestModule.ColorQuset = { -- ! Подумать насчет разных тем 
    ColorQusetFrame = {
        ["Bread"] = {
            ["Down"] = Color3.fromRGB(143, 84, 36),
            ["Up"] = Color3.fromRGB(110, 65, 28)
        },

        ['Snail'] = {Color3.fromRGB(000)},
        ['Vladislov'] = {Color3.fromRGB(000)}
    }
}
print(QuestModule.ColorQuset.ColorQusetFrame['Bread'])
print(QuestModule.ColorQuset.ColorQusetFrame)
print(QuestModule.ColorQuset)
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
            --!  print(i) -- number
            --! print(v) -- Task
        end

        if v.Type == "CollectCoin" then
            print("CollectCoin")
        elseif v.Type == "KillHilder" then
            print("KillHilder")
        elseif v.Type == "KillSeeker" then
            print("KillSeeker")
        elseif v.Type == "CollectTokenMap" then
            print("CollectTokenMap")
        elseif v.Type == "TimeGame" then
            print("TimeGame")
        end
    end
end

function ButtonClick(Button)
    TWS:BittonClick(Button)
end

function NewQuestNPC(TypeQuest, NPC) -- ! Добавить и проверить квесты
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
                Remote.QuestRemote:FireServer(NPC) -- ! PData update
                local function ColorDown()
                    QuestModule.ColorQuset.ColorQusetFrame['Bread'].Down = QuestFrame.QuestIcon.BackgroundColor3
                    QuestModule.ColorQuset.ColorQusetFrame['Bread'].Down = QuestFrame.QuestNumber.BackgroundColor3 
                    QuestModule.ColorQuset.ColorQusetFrame['Bread'].Down = QuestFrame.QusetFrameDiologs.BackgroundColor3
                    QuestModule.ColorQuset.ColorQusetFrame['Bread'].Down = QuestFrame.QusetTextNameNPC.BackgroundColor3
                end

                
                ColorDown()
                OpenGuiQuest(QuestFrame) -- OpenMenu
                --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)

               QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset[Index]
                QuestFrame.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.NewQuset then --// Счет по [1]...
                        GuiQuset:NewQuestGUI(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest])
                        CloseGuiQuest(QuestFrame)
                        Index = 1
                        task.wait(0.3)
                        NofficalModule:NewQuest(NPC)
                    else
                        ButtonClick(QuestFrame)
                        --print(DialogsModule.NewQuset[Index])
                        QuestFrame.Frame.TextLabel.Text = DialogsModule.NewQuset[Index]
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
                OpenGuiQuest(QuestFrame)
                QuestFrame.Frame.TextLabel.Text = DialogsModule.OldQuset[Index]
                QuestFrame.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.OldQuset then --// Счет по [1]...
                        CloseGuiQuest(QuestFrame)
                        Index = 1 
                    else
                        ButtonClick(QuestFrame)
                        --print(DialogsModule.OldQuset[Index])
                        QuestFrame.Frame.TextLabel.Text = DialogsModule.OldQuset[Index]
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
                OpenGuiQuest(QuestFrame)
                QuestFrame.Frame.TextLabel.Text = DialogsModule.Completed[Index]
                QuestFrame.ButtonQuest.MouseButton1Click:Connect(function()
                    Index += 1
                    if Index > #DialogsModule.Completed then --// Счет по [1]...
                        CloseGuiQuest(QuestFrame)
                        Index = 1
                    else
                        ButtonClick(QuestFrame)
                        QuestFrame.Frame.TextLabel.Text = DialogsModule.Completed[Index]
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