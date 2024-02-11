local Players = game:GetService("Players").LocalPlayer
local PlayerGui = Players:WaitForChild('PlayerGui')
local UI = PlayerGui:WaitForChild("UI")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TW = game:GetService('TweenService')
local Remote = game.ReplicatedStorage:WaitForChild("Remote")
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local DialogsModuleFolder = require(game.ReplicatedStorage:WaitForChild('ClientScript').QuestModule.DiaolgsNPC)
local NofficalModule = require(game.ReplicatedStorage.ClientScript.Notifical)
local GuiQuset = require(script.Parent.OpenGui)
local Utils = require(game.ReplicatedStorage.Libary.Utils)

local TiggerStop = false
local TiggerStop2 = false
local Complish = false


local QusetTable =  {
    TableIndex = {
        ["DiologOne"] = 1,
        ["DiologPlayer"] = 0,
        ["DiologTwo"] = 0
    },
    TableIndex2 = {
        ["DiologOne"] = 1,
        ["DiologPlayer"] = 0,
        ["DiologTwo"] = 0
    },
    TableIndex3 = {
        ["DiologOne"] = 1,
        ["DiologPlayer"] = 0,
        ["DiologTwo"] = 0
    },
    TableNoQuset = {
        ['Diologs'] = 1,
    }
}


local Cam  = game.Workspace.CurrentCamera

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
            [1] = Color3.fromRGB(143, 84, 36),
            [2] = Color3.fromRGB(110, 65, 28)
        },

        ['Snail'] = {Color3.fromRGB(000)},
        ['Vladislov'] = {Color3.fromRGB(000)},
        ["PlayerGame"] =  {
            [1] = Color3.fromRGB(81, 185, 25),
            [2] = Color3.fromRGB(59, 136, 18)
        }
    }
}

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
    TWS:GuiFrameShop(GuiName, 0.5,{Position = UDim2.new(0.49, 0,0.655, 0)}) --* Открытие
end

function CloseGuiQuest(GuiName)
    TWS:GuiFrameShop(GuiName, 1.5,{Position = UDim2.new(0.49, 0,3, 0)}) --* Закрытие
end


function NPCFind(NPC) --* Проверка на каком этапе квес у игрока 
    local TypeQuest 
    if not _G.PData.QuestNPC[NPC].NowQuest and not _G.PData.QuestNPC[NPC].NoQuset  then --* Если нет то, нету квеста
        print(_G.PData.QuestNPC[NPC])
        TypeQuest = "NewQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].NowQuest == true and not _G.PData.QuestNPC[NPC].Complish  and not _G.PData.QuestNPC[NPC].NoQuset then --* Если есть первое, но нет второго значить в процеессе выполнения
        TypeQuest = "OldQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].Complish and _G.PData.QuestNPC[NPC].NowQues and not _G.PData.QuestNPC[NPC].NoQuset then --* Если то и то тогда конец квеста
        TypeQuest = "Completed"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].QuestEvent and not _G.PData.QuestNPC[NPC].NoQuset then
        TypeQuest = "EventQuest"
        NewQuestNPC(TypeQuest, NPC)
    elseif _G.PData.QuestNPC[NPC].NoQuset then
        TypeQuest = "NoQuset"
        NewQuestNPC(TypeQuest, NPC)
    end
    return TypeQuest
end

function TaskQuset(NPC) -- ! Надо сделать гуи
    local QusetInfoModule = DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest]
    print(QusetInfoModule)
    local FrameQusetAll = ReplicatedStorage.Assert.QusetFrame.FrameQuset:Clone()
    FrameQusetAll.FrameQusetFrame.FrameQusetFrameUper.TextLabel.Text = QusetInfoModule.NameQuset
    FrameQusetAll.FrameQusetFrame.FrameQusetFrameUper.IconFrame.ImageLabel.Image = QusetInfoModule.Icon
    FrameQusetAll.FrameQusetFrame.FrameQusetFrameUper.NumberFrame.TextLabel.Text = _G.PData.QuestNPC[NPC].TotalQuest

    local FrameTask = ReplicatedStorage.Assert.QusetFrame.FrameTask:Clone()
    FrameTask.Parent = FrameQusetAll.FrameQusetFrame.FrameTaskSize

    local TextQusetTask = FrameTask.FrameTaskDown.TextQusetTask -- * NameQuset
    local TextQusetTaskPresent = FrameTask.FrameTaskDown.TextQusetTaskPresent -- * Present
    for i, v in pairs(QusetInfoModule.Task) do
        if i > 1 then -- ! Gui Need scriptTask
            FrameQusetAll.FrameQusetFrame.FrameTaskSize.Size = UDim2.new()
            FrameQusetAll.Size = UDim2.new()
            --!  print(i) -- number
             print(v) -- Task
        end
        FrameQusetAll.Name = QusetInfoModule.NameQuset.."-".._G.PData.QuestNPC[NPC].TotalQuest
        FrameQusetAll.Parent = UI.Tabs.QusetTabs.QusetTabs.Frame.ScrollingFrame
        print(v)
        local NdAmt
        local StAmt
        print(v.StartAmt)
        print(v.NeedAmt)
        if v.StartAmt >= 100000000000000 then
            StAmt = Utils:Prefix(v.StartAmt)
        else
            StAmt = Utils:CommaNumber(v.StartAmt)
        end

        if v.NeedAmt >= 100000000000000 then
            NdAmt = Utils:Prefix(v.StartAmt)
        else
            NdAmt = Utils:CommaNumber(v.StartAmt)
        end
        

        if v.Type == "CollectCoin" then
            TextQusetTask.Text = "Collect Coin on map:"
            TextQusetTaskPresent.Text = StAmt.." / "..NdAmt
            --print("CollectCoin")
        elseif v.Type == "KillSeeker" then
            TextQusetTask.Text = "Kill the seeker in the game:"
            TextQusetTaskPresent.Text = StAmt.." / "..NdAmt
           -- print("KillHilder")
        elseif v.Type == "KillSeeker" then -- ! hiding
            TextQusetTask.Text = "Kill the hiding in the game:"
            TextQusetTaskPresent.Text = StAmt.." / "..NdAmt
          --  print("KillSeeker")
        elseif v.Type == "CollectTokenMap" then
            TextQusetTask.Text = "Collect Token on Map:"
            TextQusetTaskPresent.Text = StAmt.." / "..NdAmt
          --  print("CollectTokenMap")
        elseif v.Type == "TimeGame" then
            TextQusetTask.Text = "Play this game for so long:"
            TextQusetTaskPresent.Text = StAmt.." / "..NdAmt
           -- print("TimeGame")
        end
    end
    
end

function ButtonClick(Button)
    TWS:BittonClick(Button)
end

function NewQuestNPC(TypeQuest, NPC) -- ! Добавить и проверить квесты

    local function ColorUp()
        QuestFrame.QuestIcon.QuestIcon2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][1]
        QuestFrame.QuestNumber.QuestNumber2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][1]
        QuestFrame.QusetFrameDiologs.QusetFrameText.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][1]
        QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][1]
    end

    local function ColorDown()
        QuestFrame.QuestIcon.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][2]
        QuestFrame.QuestNumber.BackgroundColor3  = QuestModule.ColorQuset.ColorQusetFrame[NPC][2]
        QuestFrame.QusetFrameDiologs.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame[NPC][2]
        QuestFrame.QusetTextNameNPC.BackgroundColor3 =  QuestModule.ColorQuset.ColorQusetFrame[NPC][2]
    end

    local function ColorUpNPC()
        QuestFrame.QuestIcon.QuestIcon2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][1]
        QuestFrame.QuestNumber.QuestNumber2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][1]
        QuestFrame.QusetFrameDiologs.QusetFrameText.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][1]
        QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][1]
    end

    local function ColorDownNPC()
        QuestFrame.QuestIcon.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][2]
        QuestFrame.QuestNumber.BackgroundColor3  = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][2]
        QuestFrame.QusetFrameDiologs.BackgroundColor3 = QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][2]
        QuestFrame.QusetTextNameNPC.BackgroundColor3 =  QuestModule.ColorQuset.ColorQusetFrame["PlayerGame"][2]
    end

    if not _G.PData.QuestNPC[NPC].Complish then
        QusetTable.TableIndex2.DiologOne = 1
        QusetTable.TableIndex2.DiologPlayer = 0
        QusetTable.TableIndex2.DiologTwo = 0
    end
    
    if not DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest] then
        warn("Not Quset")
        --TaskQuset(NPC)
    else
        local DialogsModule = DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest].Dialogs
        --TaskQuset(NPC)
        
        if TypeQuest == 'NewQuest' and not TiggerStop then -- ! Новый квест
        if NPC == "Bread" then
            if not _G.PData.QuestNPC[NPC].NowQuest then
                QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                QuestFrame.QuestNumber.QuestNumber2.TextLabel.Text = _G.PData.QuestNPC[NPC].TotalQuest
                _G.PData.QuestNPC[NPC].NowQuest = true
                Remote.QuestRemote:FireServer(NPC) -- ! PData update
                QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.TextLabel.Text = NPC
                ColorDown()
                ColorUp()
                OpenGuiQuest(QuestFrame) -- OpenMenu
                --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)
                Cam.CameraType = Enum.CameraType.Scriptable
                TW:Create(Cam,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {CFrame = workspace.QusetNPC.Bread.Camera.Part.CFrame}):Play()
                --TW:Create()
               -- TweenNow = TW:Create(Cam,TweenInfo.new(18, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraFoder['Cam'..CameraNow].CFrame})
                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.QusetNPCDiologs1[QusetTable.TableIndex.DiologOne]
                QuestFrame.QusetFrameDiologs.ButtonMouse.MouseButton1Click:Connect(function()
                    --print(TableIndex.DiologOne)
                    if QusetTable.TableIndex.DiologOne < #DialogsModule.NewQuset.QusetNPCDiologs1 then
                        ColorDown()
                        ColorUp()
                        QusetTable.TableIndex.DiologOne += 1
                        ButtonClick(QuestFrame)
                        QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.QusetNPCDiologs1[QusetTable.TableIndex.DiologOne]
                        --print(DialogsModule.NewQuset[Index])
                        local NumberMax = math.max(#DialogsModule.NewQuset.QusetNPCDiologs1)
                        if QusetTable.TableIndex.DiologOne > NumberMax then
                            QusetTable.TableIndex.DiologPlayer = 1
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.PlayerDiologs[QusetTable.TableIndex.DiologPlayer]
                        end
                        -- #DialogsModule.NewQuset.QusetNPCDiologs1 -- ! это максимальное число
                        

                    elseif QusetTable.TableIndex.DiologPlayer < #DialogsModule.NewQuset.PlayerDiologs then
                        local content = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                        QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = content
                        QusetTable.TableIndex.DiologPlayer += 1
                        ColorDownNPC()
                        ColorUpNPC()
                        ButtonClick(QuestFrame)
                        QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.PlayerDiologs[QusetTable.TableIndex.DiologPlayer]
                        local NumberMax = math.max(#DialogsModule.NewQuset.PlayerDiologs)
                        if QusetTable.TableIndex.DiologPlayer > NumberMax then
                            QusetTable.TableIndex.DiologTwo = 1
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.QusetNPCDiologs2[QusetTable.TableIndex.DiologTwo]
                        end

                    elseif QusetTable.TableIndex.DiologTwo < #DialogsModule.NewQuset.QusetNPCDiologs2 then
                        QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                        ColorDown()
                        ColorUp()
                        QusetTable.TableIndex.DiologTwo += 1
                        ButtonClick(QuestFrame)
                        QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.NewQuset.QusetNPCDiologs2[QusetTable.TableIndex.DiologTwo]
                        local NumberMax = math.max(#DialogsModule.NewQuset.QusetNPCDiologs2)
                        if QusetTable.TableIndex.DiologTwo >= NumberMax then
                            CloseGuiQuest(QuestFrame)
                            Cam.CameraType = Enum.CameraType.Custom
                            TaskQuset(NPC)
                            task.wait(0.3)

                          --  TableIndex.DiologOne = 1
                          --  TableIndex.DiologPlayer = 0
                          --  TableIndex.DiologTwo = 0

                            TiggerStop = true
                            NofficalModule:NewQuest(NPC)
                           -- GuiQuset:NewQuestGUI(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest])
                           -- print(TiggerStop)
                        end
                    end
                end)
            end
        end
    
        elseif TypeQuest == 'OldQuest' and TiggerStop then
       -- print(TypeQuest)
            if NPC == "Bread" then
                if _G.PData.QuestNPC[NPC].NowQuest then
                    local Connection
                    QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                    QuestFrame.QuestNumber.QuestNumber2.TextLabel.Text = _G.PData.QuestNPC[NPC].TotalQuest
                    --Remote.QuestComplish:FireServer(NPC) -- ! PData update
                    QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.TextLabel.Text = NPC
                    ColorDown()
                    ColorUp()
                    OpenGuiQuest(QuestFrame) -- OpenMenu
                    --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)
                    Cam.CameraType = Enum.CameraType.Scriptable
                    TW:Create(Cam,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {CFrame = workspace.QusetNPC.Bread.Camera.Part.CFrame}):Play()
                    --TW:Create()
                -- TweenNow = TW:Create(Cam,TweenInfo.new(18, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraFoder['Cam'..CameraNow].CFrame})
                    QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.QusetNPCDiologs1[QusetTable.TableIndex2.DiologOne]
                    Connection = QuestFrame.QusetFrameDiologs.ButtonMouse.MouseButton1Click:Connect(function()
    
                      --  print(QusetTable.TableIndex2)
                        if QusetTable.TableIndex2.DiologOne < #DialogsModule.OldQuset.QusetNPCDiologs1  then
                        --  print(QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text)
                            ColorDown()
                            ColorUp()
                            QusetTable.TableIndex2.DiologOne += 1
                            -- print(TableIndex2)
                            --print(TableIndex)
                            ButtonClick(QuestFrame)
                          --  print(DialogsModule.OldQuset.QusetNPCDiologs1[QusetTable.TableIndex2.DiologOne])
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.QusetNPCDiologs1[QusetTable.TableIndex2.DiologOne]
                            --print(DialogsModule.NewQuset[Index])
                            local NumberMax = math.max(#DialogsModule.OldQuset.QusetNPCDiologs1)
                            if QusetTable.TableIndex2.DiologOne > NumberMax then
                                QusetTable.TableIndex2.DiologPlayer = 1
                                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.PlayerDiologs[QusetTable.TableIndex2.DiologPlayer]
                            end
                            -- #DialogsModule.NewQuset.QusetNPCDiologs1 -- ! это максимальное число
                            

                        elseif QusetTable.TableIndex2.DiologPlayer < #DialogsModule.OldQuset.PlayerDiologs then
                            local content = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                            QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = content
                            QusetTable.TableIndex2.DiologPlayer += 1
                            ColorDownNPC()
                            ColorUpNPC()
                            ButtonClick(QuestFrame)
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.PlayerDiologs[QusetTable.TableIndex2.DiologPlayer]
                            local NumberMax = math.max(#DialogsModule.OldQuset.PlayerDiologs)
                            if QusetTable.TableIndex2.DiologPlayer > NumberMax then
                                QusetTable.TableIndex2.DiologTwo = 1
                                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.QusetNPCDiologs2[QusetTable.TableIndex2.DiologTwo]
                            end

                        elseif QusetTable.TableIndex2.DiologTwo < #DialogsModule.OldQuset.QusetNPCDiologs2 then
                            QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                            ColorDown()
                            ColorUp()
                            QusetTable.TableIndex2.DiologTwo += 1
                            ButtonClick(QuestFrame)
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.OldQuset.QusetNPCDiologs2[QusetTable.TableIndex2.DiologTwo]

                            task.wait(0.5)
                            local NumberMax = math.max(#DialogsModule.OldQuset.QusetNPCDiologs2)
                            if QusetTable.TableIndex2.DiologTwo >= NumberMax then
                                CloseGuiQuest(QuestFrame)
                                
                                Cam.CameraType = Enum.CameraType.Custom
                                --TaskQuset(NPC)
                                task.wait(0.3)
                                Connection:Disconnect()
                                TiggerStop2 = true
                                --_G.PData.QuestNPC[NPC].Complish = true
                                --GuiQuset:NewQuestGUI(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest])
                            end
                        end
                    end)
                end
            end
        elseif TypeQuest == 'Completed' and TiggerStop2 then
            if NPC == "Bread" then
               -- print('Completed')
                    
                    if _G.PData.QuestNPC[NPC].Complish then
                        QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                        QuestFrame.QuestNumber.QuestNumber2.TextLabel.Text = _G.PData.QuestNPC[NPC].TotalQuest
                        _G.PData.QuestNPC[NPC].NowQuest = true
                        Remote.QuestRemote:FireServer(NPC) -- ! PData update
                        QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.TextLabel.Text = NPC
                        ColorDown()
                        ColorUp()
                        OpenGuiQuest(QuestFrame) -- OpenMenu
                        --TextPrint(BreadGui.Frame.TextLabel, 0.1, DialogsModule)
                        Cam.CameraType = Enum.CameraType.Scriptable
                        TW:Create(Cam,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {CFrame = workspace.QusetNPC.Bread.Camera.Part.CFrame}):Play()
                        --TW:Create()
                    -- TweenNow = TW:Create(Cam,TweenInfo.new(18, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraFoder['Cam'..CameraNow].CFrame})
                        QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.QusetNPCDiologs1[QusetTable.TableIndex3.DiologOne]
                        QuestFrame.QusetFrameDiologs.ButtonMouse.MouseButton1Click:Connect(function()
                            --print(TableIndex.DiologOne)
                            if QusetTable.TableIndex3.DiologOne < #DialogsModule.Completed.QusetNPCDiologs1 then
                                ColorDown()
                                ColorUp()
                                QusetTable.TableIndex3.DiologOne += 1
                                ButtonClick(QuestFrame)
                                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.QusetNPCDiologs1[QusetTable.TableIndex3.DiologOne]
                                --print(DialogsModule.NewQuset[Index])
                                local NumberMax = math.max(#DialogsModule.Completed.QusetNPCDiologs1)
                                if QusetTable.TableIndex3.DiologOne > NumberMax then
                                    QusetTable.TableIndex3.DiologPlayer = 1
                                    QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.PlayerDiologs[QusetTable.TableIndex3.DiologPlayer]
                                end
                                -- #DialogsModule.NewQuset.QusetNPCDiologs1 -- ! это максимальное число
                                
        
                            elseif QusetTable.TableIndex3.DiologPlayer < #DialogsModule.Completed.PlayerDiologs then
                                local content = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                                QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = content
                                QusetTable.TableIndex3.DiologPlayer += 1
                                ColorDownNPC()
                                ColorUpNPC()
                                ButtonClick(QuestFrame)
                                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.PlayerDiologs[QusetTable.TableIndex3.DiologPlayer]
                                local NumberMax = math.max(#DialogsModule.Completed.PlayerDiologs)
                                if QusetTable.TableIndex3.DiologPlayer > NumberMax then
                                    QusetTable.TableIndex3.DiologTwo = 1
                                    QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.QusetNPCDiologs2[QusetTable.TableIndex3.DiologTwo]
                                end
        
                            elseif QusetTable.TableIndex.DiologTwo < #DialogsModule.Completed.QusetNPCDiologs2 then
                                QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                                ColorDown()
                                ColorUp()
                                QusetTable.TableIndex3.DiologTwo += 1
                                ButtonClick(QuestFrame)
                                QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModule.Completed.QusetNPCDiologs2[QusetTable.TableIndex3.DiologTwo]
                                local NumberMax = math.max(#DialogsModule.Completed.QusetNPCDiologs2)
                                if QusetTable.TableIndex3.DiologTwo >= NumberMax then
                                    CloseGuiQuest(QuestFrame)
                                    Cam.CameraType = Enum.CameraType.Custom
                                    --TaskQuset(NPC)
                                    task.wait(0.3)
                                    Remote.QuestComplish:FireServer(NPC)
                                    --TableIndex.DiologOne = 1
                                    --TableIndex.DiologPlayer = 0
                                    --TableIndex.DiologTwo = 0
        
                                    TiggerStop = true
                                    NofficalModule:ComplishQuset(NPC)
                                    --GuiQuset:NewQuestGUI(DialogsModuleFolder.QuesetDialog[NPC].QusetTable[_G.PData.QuestNPC[NPC].TotalQuest])
                                  --  print(TiggerStop)
                                end
                            end
                        end)
                    end      
                end
        elseif TypeQuest == 'EventQuest' then
            if NPC == '' then
                print('Event')
            end
        elseif TypeQuest == 'NoQuset' then --! Дописать
            if NPC == 'Bread' then
                local Connection
                Cam.CameraType = Enum.CameraType.Scriptable
                TW:Create(Cam,TweenInfo.new(0.5, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), {CFrame = workspace.QusetNPC.Bread.Camera.Part.CFrame}):Play()
                local DialogsModuleNoQuest = DialogsModuleFolder.QuesetDialog[NPC].NoQuset
                local NumberMax = math.max(#DialogsModuleFolder.QuesetDialog[NPC].QusetTable)
              --  print(NumberMax)
                if _G.PData.QuestNPC[NPC].TotalQuest == NumberMax then  
                    ColorDown()
                    ColorUp()
                    QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModuleNoQuest[QusetTable.TableNoQuset.Diologs]
                    OpenGuiQuest(QuestFrame)
                    QuestFrame.QuestIcon.QuestIcon2.ImageLabel.Image = DialogsModuleFolder.QuesetDialog[NPC].Icon
                    QuestFrame.QuestNumber.QuestNumber2.TextLabel.Text = _G.PData.QuestNPC[NPC].TotalQuest
                    --Remote.QuestComplish:FireServer(NPC) -- ! PData update
                    QuestFrame.QusetTextNameNPC.QusetTextNameNPC2.TextLabel.Text = NPC
                    Connection = QuestFrame.QusetFrameDiologs.ButtonMouse.MouseButton1Click:Connect(function()
                        if QusetTable.TableNoQuset.Diologs < #DialogsModuleNoQuest then
                            QusetTable.TableNoQuset.Diologs += 1
                            ButtonClick(QuestFrame)
                            QuestFrame.QusetFrameDiologs.QusetFrameText.TextFrame.Text = DialogsModuleNoQuest[QusetTable.TableNoQuset.Diologs]
                            local NumberMax = math.max(#DialogsModuleNoQuest)
                         --   print(NumberMax)
                            task.wait(0.3)
                            if QusetTable.TableNoQuset.Diologs >= NumberMax then
                                CloseGuiQuest(QuestFrame)
                                QusetTable.TableNoQuset.Diologs = 1
                                Connection:Disconnect()
                                Cam.CameraType = Enum.CameraType.Custom
                            end
                        end
                    end)
                end
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
        --print(Index)
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