local Player = game:GetService("Players").LocalPlayer
local Inventory = {}
--[[
function Inventory:InventoryNewItems()
    local FolderItems = game.Workspace.FoldetToken --! Create Folder
    local TWS = require(game.ReplicatedStorage.Libary.TweenService)
    local Inventory = require(script.Parent.InventorySystems)
    local Noffical = require(script.Parent.Notifical) --! Create Function Get token
    local Remote = game.ReplicatedStorage:WaitForChild('Remote')
    repeat _G.PData = Remote.GetDataSave:InvokeServer() until _G.PData
    print(_G.PData)
    
    local TokenGet = false

    for _, index in next, FolderItems:GetChildren() do
        index.Touched:Connect(function()
            if not TokenGet then
                local TokenName = index.Name
                for _, indexTabs in pairs(Inventory.InventoryItems:GetChildren()) do --* Get from Globule Tabs, we Name token in table
                    print(indexTabs)
                    if TokenName == indexTabs then
                        Remote.GetToken:FireServer(indexTabs) --! Create remoteEvent
                        Noffical:GetToken() --! Create function and write Arguments
                        InventoryGui(TokenName,indexTabs)
                        index:Destroy()
                        TokenGet = true
                        task.wait(3)
                        TokenGet = false
                    else
                        warn('TokenName not tabs')
                    end
                end
                print(TokenName)
            end
        end)
    end
end

Inventory:InventoryNewItems()

function InventoryGui(Product, indexTabs)
    local PlayerGui = Player:WaitForChild('PlayerGui')
    local Inventory = PlayerGui:WaitForChild('UI').Tabs.InventoryTabs.QusetTabs.Frame.ScrollingFrame

    local FrameGui = game.ReplicatedStorage.Assert.GuiItems.TemplateNewItems:Clone()--! itemsGui
    FrameGui.Name = Product.Name
    FrameGui.Parent = Inventory
    FrameGui.FrameIcon.Frame.ImageLabel.Image = indexTabs.icon
    FrameGui.FrameIconText.Frame.TextLabel = indexTabs.NameToken
end
]]
return Inventory