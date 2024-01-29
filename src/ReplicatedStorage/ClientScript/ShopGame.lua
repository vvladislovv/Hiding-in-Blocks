local ShopGame = {}
--// дописать чтобы не было бага с мышкой
local Remote = game:GetService('ReplicatedStorage'):WaitForChild('Remote')
local TWS = require(game.ReplicatedStorage:WaitForChild('Libary').TweenService)
local CameraFoder = workspace.Shop:WaitForChild('Camera')
local TW = game:GetService('TweenService')
local PP = workspace.Shop.EventButton.PP
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild('PlayerGui')
local ShopGui = PlayerGui:WaitForChild('UI').Shop
local Debouse = false
local Cam  = game.Workspace.CurrentCamera
local Lighting = game:GetService("Lighting")
local OpenShop = false
local TweenNow = nil

ShopGui.ShopFrame.CloseFrame.TextButton.MouseButton1Click:Connect(function()
    OpenShop = false
    if TweenNow then
        TweenNow:Cancel()
    end
    TWS:GuiFrameShop(ShopGui, 1, {Position = UDim2.new(0.106, 0,3, 0)})
    Cam.CameraType = Enum.CameraType.Custom
    Lighting.BlurScreen.Enabled = false
    Debouse = false
end)
PP.Triggered:Connect(function()
    OpenShop = true
    Lighting.BlurScreen.Enabled = true
    TWS:GuiFrameShop(ShopGui, 1, {Position = UDim2.new(0.106, 0,0.095, 0)})
    local CameraNow = 1
    Cam.CameraType = Enum.CameraType.Scriptable
    Cam.CFrame = CameraFoder.Cam1.CFrame
    while OpenShop do
        CameraNow += 1
        if CameraNow > #CameraFoder:GetChildren() then
            CameraNow = 1
        end
        TweenNow = TW:Create(Cam,TweenInfo.new(3, Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{CFrame = CameraFoder['Cam'..CameraNow].CFrame})
        TweenNow:Play()
        task.wait(2)
    end
end)


return ShopGame