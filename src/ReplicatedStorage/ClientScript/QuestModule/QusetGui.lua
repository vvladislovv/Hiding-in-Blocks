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
Menu.OpenButton.MouseButton1Click:Connect(function()
    if not Quester then
        TW:Create(Menu,TweenInfo.new(0.3,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0, 0,0.2, 0)}):Play()
        MenuTokenGui.ImageBagesButton.MouseButton1Click:Connect(function()
            if not Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Linear", 0.3)
                Imagelabel = true
                ForlderSound.Bubble:Play()

            elseif Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Linear", 0.3)
                Imagelabel = false
                ForlderSound.Bubble:Play()

            end
        end)
        MenuTokenGui.ImageInventoryButton.MouseButton1Click:Connect(function()
            if not Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Linear", 0.3)
                Imagelabel = true
                ForlderSound.Bubble:Play()

            elseif Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Linear", 0.3)
                Imagelabel = false
                ForlderSound.Bubble:Play()

            end
        end)
        MenuTokenGui.ImageTasksButton.MouseButton1Click:Connect(function()
            if not Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Linear", 0.3)
                Imagelabel = true
                ForlderSound.Bubble:Play()

            elseif Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Linear", 0.3)
                Imagelabel = false
                ForlderSound.Bubble:Play()

            end
        end)
        MenuTokenGui.ImageDonatButton.MouseButton1Click:Connect(function()
            if not Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Linear", 0.3)
                Imagelabel = true
                ForlderSound.Bubble:Play()

            elseif Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Linear", 0.3)
                Imagelabel = false
                ForlderSound.Bubble:Play()

            end
        end)
        MenuTokenGui.ImageQuestButton.MouseButton1Click:Connect(function()
            if not Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(1, 0, 1, 0), "InOut", "Linear", 0.3)
                Imagelabel = true
                ForlderSound.Bubble:Play()

            elseif Imagelabel then
                Tabs.ImageLabel:TweenSize(UDim2.new(0, 0, 0, 0), "InOut", "Linear", 0.3)
                Imagelabel = false
                ForlderSound.Bubble:Play()

            end
        end)
        ForlderSound.Bubble:Play()
        Menu.OpenButton.Image = 'rbxassetid://16266866309'
       -- TW:Create(Menu.OpenButton,TweenInfo.new(1,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.81, 0,2.135, 0)}):Play()
        Quester = true
    elseif Quester then
        TW:Create(Menu,TweenInfo.new(0.3,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(-0.08, 0,0.2, 0)}):Play()
        Menu.OpenButton.Image = 'rbxassetid://16266876479'
        ForlderSound.Bubble:Play()
        --TW:Create(Menu.OpenButton,TweenInfo.new(1,Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),{Position = UDim2.new(0.81, 0,2.135, 0)}):Play()
        Quester = false
    end
end)

function QuestGui:NewQuestGUI(Info)
    if Info then
        print(Info)
    end
end
return QuestGui