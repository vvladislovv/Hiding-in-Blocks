local UserInputService = game:GetService("UserInputService")
local QuestGui = {}

local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild('PlayerGui')
--local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local TW = game:GetService('TweenService')
local UI = PlayerGui:WaitForChild('UI')
local Tabs = UI:WaitForChild('Tabs')
local Menu = PlayerGui:WaitForChild('UI').Menu
local MenuTokenGui = Menu.MenuToken
local Quester = false
local ForlderSound = game:GetService('SoundService').Menu
local Imagelabel = false
local Utils = require(game.ReplicatedStorage.Libary.Utils)

local TableFrame = {
    ['Quest'] = false,
    ['Badge'] = false,
    ['Donat'] = false,
    ['Inventory'] = false,
    ['Task'] = false,
    ['ButtonView'] = false
}


_G.PData = game.ReplicatedStorage.Remote.GetDataSave:InvokeServer()
game.ReplicatedStorage.Remote.ClientDataUpdate.OnClientEvent:Connect(function(key, value)
	_G.PData[key] = value
	if key == 'BaseSettings'then
		UI.CoinFrame.TextLabel.Text = _G.PData.BaseSettings.Sneliki
	end
end)


UI.CoinFrame.TextLabel.Text = _G.PData.BaseSettings.Sneliki

Menu.OpenButton.MouseButton1Click:Connect(function()
    if not Quester then
        TW:Create(Menu,TweenInfo.new(0.3,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.633, 0,0.84, 0)}):Play()
        

        MenuTokenGui.ImageQuestButton.MouseButton1Click:Connect(function()
            if not TableFrame.Quest then -- {-0.579, 0},{-4.705, 0}
                Tabs.QusetTabs:TweenPosition(UDim2.new(-0.46, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = true
                ForlderSound.Bubble:Play()
                
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = false
                Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = false
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Inventory = false
                Tabs.TaskTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.ButtonView = false
                Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                TableFrame.Task = false

            elseif TableFrame.Quest then
                Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = false
                ForlderSound.Bubble:Play()
            end
        end)

        MenuTokenGui.ImageBagesButton.MouseButton1Click:Connect(function()
            if not TableFrame.Badge then
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-0.46, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = true
                ForlderSound.Bubble:Play()

                Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = false
                Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = false
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Inventory = false
                Tabs.TaskTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.ButtonView = false
                Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                TableFrame.Task = false

            elseif TableFrame.Badge then
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = false
                ForlderSound.Bubble:Play()
            end
        end)

        MenuTokenGui.ImageDonatButton.MouseButton1Click:Connect(function()
            if not TableFrame.Donat then
                Tabs.DonatTabs:TweenPosition(UDim2.new(-0.46, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = true

                Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = false
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = false
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Inventory = false
                Tabs.TaskTabs:TweenPosition(UDim2.new(-31, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Task = false
                Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                TableFrame.ButtonView = false

                ForlderSound.Bubble:Play()
            elseif TableFrame.Donat then
                Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = false
                ForlderSound.Bubble:Play()
            end
        end)

        MenuTokenGui.ImageInventoryButton.MouseButton1Click:Connect(function()
            if not TableFrame.Inventory then
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-0.46, 0,-0.006, 0), "InOut", "Linear", 0.3)
                
                Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = false
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = false
                Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = false
                Tabs.TaskTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Task = false
                Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                TableFrame.ButtonView = false

                TableFrame.Inventory = true
                ForlderSound.Bubble:Play()
            elseif TableFrame.Inventory then
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                ForlderSound.Bubble:Play()
            end

        end)
        MenuTokenGui.ImageTasksButton.MouseButton1Click:Connect(function()
            if not TableFrame.Task then
                Tabs.TaskTabs:TweenPosition(UDim2.new(-0.46, 0,-0.006, 0), "InOut", "Linear", 0.3)
                
                Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Quest = false
                Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Badge = false
                Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Donat = false
                Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Inventory = false
                Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                TableFrame.ButtonView = false

                TableFrame.Task = true
                ForlderSound.Bubble:Play()

            elseif TableFrame.Task then
                Tabs.TaskTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
                TableFrame.Task = false
                ForlderSound.Bubble:Play()
            end
        end)


        ForlderSound.Bubble:Play()
        Menu.OpenButton.Image = 'rbxassetid://16266876479'--rbxassetid://16266876479
       -- TW:Create(Menu.OpenButton,TweenInfo.new(1,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.81, 0,2.135, 0)}):Play()
        Quester = true
    elseif Quester then

        MenuTokenGui.ImageTasksButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
        MenuTokenGui.ImageQuestButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
        MenuTokenGui.ImageInventoryButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
        MenuTokenGui.ImageBagesButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
        MenuTokenGui.ImageDonatButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)

        Tabs.TaskTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
        TableFrame.Task = false
        Tabs.InventoryTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
        TableFrame.Inventory = false
        Tabs.QusetTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
        TableFrame.Quest = false
        Tabs.DonatTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
        TableFrame.Donat = false
        Tabs.BadgesTabs:TweenPosition(UDim2.new(-3, 0,-0.006, 0), "InOut", "Linear", 0.3)
        TableFrame.Badge = false
        Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
        TableFrame.ButtonView = false

        Imagelabel = true

        TW:Create(Menu,TweenInfo.new(0.3,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.633, 0,0.96, 0)}):Play()
        Menu.OpenButton.Image = 'rbxassetid://16266866309'
        ForlderSound.Bubble:Play()
        --TW:Create(Menu.OpenButton,TweenInfo.new(1,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.81, 0,2.135, 0)}):Play()
        Quester = false
    end
    --[[
    Menu.OpenButton.MouseEnter:Connect(function()
        Menu.OpenButton:TweenSize(UDim2.new(0, 320,0, 320),'Out','Sine',0.2,true)
    end)
    Menu.OpenButton.MouseLeave:Connect(function()
        Menu.OpenButton:TweenSize(UDim2.new(0, 300,0, 300),'Out','Sine',0.2,true)
    end)]]
end)

function MouseSizeButton()
    MenuTokenGui.ImageTasksButton.MouseEnter:Connect(function()
        MenuTokenGui.ImageTasksButton:TweenSize(UDim2.new(0, 110,0, 110),'InOut','Linear',0.2)
    end)
    MenuTokenGui.ImageTasksButton.MouseLeave:Connect(function()
        MenuTokenGui.ImageTasksButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
    end)

    MenuTokenGui.ImageQuestButton.MouseEnter:Connect(function()
        MenuTokenGui.ImageQuestButton:TweenSize(UDim2.new(0, 110,0, 110),'InOut','Linear',0.2)
    end)
    MenuTokenGui.ImageQuestButton.MouseLeave:Connect(function()
        MenuTokenGui.ImageQuestButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
    end)

    MenuTokenGui.ImageInventoryButton.MouseEnter:Connect(function()
        MenuTokenGui.ImageInventoryButton:TweenSize(UDim2.new(0, 110,0, 110),'InOut','Linear',0.2)
    end)
    MenuTokenGui.ImageInventoryButton.MouseLeave:Connect(function()
        MenuTokenGui.ImageInventoryButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
    end)

    MenuTokenGui.ImageDonatButton.MouseEnter:Connect(function()
        MenuTokenGui.ImageDonatButton:TweenSize(UDim2.new(0, 110,0, 110),'InOut','Linear',0.2)
    end)
    MenuTokenGui.ImageDonatButton.MouseLeave:Connect(function()
        MenuTokenGui.ImageDonatButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
    end)

    MenuTokenGui.ImageBagesButton.MouseEnter:Connect(function()
        MenuTokenGui.ImageBagesButton:TweenSize(UDim2.new(0, 110,0, 110),'InOut','Linear',0.2)
    end)
    MenuTokenGui.ImageBagesButton.MouseLeave:Connect(function()
        MenuTokenGui.ImageBagesButton:TweenSize(UDim2.new(0, 100,0, 100),'InOut','Linear',0.2)
    end)
end
MouseSizeButton()
 -- * Открытие подробные статы(Перенес в другую сторону)

    for _, index in next, Tabs.InventoryTabs.QusetTabs.Frame.ScrollingFrame:GetChildren() do
        task.wait(1)
        print(index)
        if index:IsA('Frame') then
            index.FrameWiev.TextButton.MouseButton1Click:Connect(function()
                if not TableFrame.ButtonView then
                    Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.006, 0), "InOut", "Linear", 0.1)
                    TableFrame.ButtonView = true
                elseif TableFrame.ButtonView then
                    Tabs.InvertStatsItems:TweenPosition(UDim2.new(0.195, 0,-0.9, 0), "InOut", "Linear", 0.1)
                    TableFrame.ButtonView = false
                end
            end) 
        end
    end

function QuestGui:UpdateBarr(Gui, Info, State) -- ! Баг на то что появлеться самый последний квест
        local NdAmt

        if Info.NeedAmt >= 100000000000000 then
            NdAmt = Utils:Prefix(Info.NeedAmt)
          --  warn(NdAmt)
        else
            NdAmt = Utils:CommaNumber(Info.NeedAmt)
          --  print(NdAmt)
        end
        --print(State)
        if State == "CollectCoin" then
            Gui.FrameTaskDown.TextQusetTaskPresent.Text = _G.PData.BaseSettings.Sneliki.."/"..NdAmt
            print(_G.PData.BaseSettings.Sneliki)
            --print("CollectCoin")
        elseif State == "KillSeeker" then
            Gui.FrameTaskDown.TextQusetTaskPresent.Text = _G.PData.BaseSettings.SeekerKillBlock.."/"..NdAmt
           -- print("KillHilder")
        elseif State == "KillHilder" then -- ! hiding
            Gui.FrameTaskDown.TextQusetTaskPresent.Text = _G.PData.BaseSettings.HyderKillBlock.."/"..NdAmt 
          --  print("KillSeeker")
        elseif State == "CollectTokenMap" then
            Gui.FrameTaskDown.TextQusetTaskPresent.Text = _G.PData.BaseSettings.CollectPassToken.."/"..NdAmt
          --  print("CollectTokenMap")
        elseif State == "TimeGame" then
            Gui.FrameTaskDown.TextQusetTaskPresent.Text = _G.PData.BaseSettings.Timer.." / "..NdAmt
           -- print("TimeGame")
        end
end

function QuestGui:QuestFrameTask(Player) --! Дописать FillBarr
    for NPCname, In in pairs(_G.PData.QuestNPC) do
        if game.Workspace.QusetNPC:FindFirstChild(NPCname) then
            if In.NowQuest and not In.Complish then
                local QusetFrame = UI.Tabs.QusetTabs.QusetTabs.Frame.ScrollingFrame
                for _, QusetIndex in pairs(QusetFrame:GetChildren()) do
                    if QusetIndex:IsA("Frame") then
                        if QusetIndex.FrameQusetFrame.FrameSize:FindFirstChild("FrameTask") then
                            for k, TaskFrame in pairs(QusetIndex.FrameQusetFrame:FindFirstChild("FrameSize"):GetChildren()) do
                                if TaskFrame:IsA('Frame') then
                                    if _G.PData.QuestTaskNPC ~= nil then
                                        for _, TaskNPC in pairs(_G.PData.QuestTaskNPC[NPCname]) do
                                            --print(TaskNPC)
                                            local mathFullBarr = math.clamp(TaskNPC.StartAmt / TaskNPC.NeedAmt, 0,1)
                                            QuestGui:UpdateBarr(TaskFrame, TaskNPC, TaskNPC.Type)
                                            if TaskFrame.FrameTaskDown:FindFirstChild('FillBar') then
                                                TaskFrame.FrameTaskDown.FillBar:TweenSize(UDim2.new(0, mathFullBarr, 0, 55), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    QuestGui:QuestFrameTask(Player)
end)

function QuestGui:NewQuestGUI(Info)
    if Info then
        print(Info)
    end
end
return QuestGui