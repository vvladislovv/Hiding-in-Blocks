local Players = game:GetService("Players")

local Framework = {}

local PlatformFolder = workspace.Platforms:WaitForChild('GamePlatforms')
local ScreenFolder = workspace:WaitForChild('SelectionGame')
local Remote = game.ReplicatedStorage:WaitForChild('Remote')
local TimerGui = game:GetService("StarterGui"):WaitForChild('TimerLooby').TextLabel
local RS = game:GetService('ReplicatedStorage')

local Votes = {
    ["PartPlatformOne"] = {},
    ["PartPlatformTwo"] = {},
    ["PartPlatformThree"] = {},
}

local GameDecal = {
    [1] = 'rbxassetid://16152784650',
    [2] = 'rbxassetid://16152620907',
    [3] = 'rbxassetid://16152944877',
    [4] = 'rbxassetid://16152948361',
    [5] = 'rbxassetid://16152971196',
    [6] = 'rbxassetid://16152971196',
    
}

function StartEffectVoice()
    if PlatformFolder.PartPlatformOne.NumberValue.Value > PlatformFolder.PartPlatformTwo.NumberValue.Value and PlatformFolder.PartPlatformOne.NumberValue.Value > PlatformFolder.PartPlatformThree.NumberValue.Value then
        PlatformFolder.PartPlatformOne.ParticleEmitter.Enabled = true
        task.wait(4)
        PlatformFolder.PartPlatformOne.ParticleEmitter.Enabled = false

    elseif PlatformFolder.PartPlatformTwo.NumberValue.Value > PlatformFolder.PartPlatformOne.NumberValue.Value and PlatformFolder.PartPlatformTwo.NumberValue.Value > PlatformFolder.PartPlatformThree.NumberValue.Value then
        PlatformFolder.PartPlatformTwo.ParticleEmitter.Enabled = true
        task.wait(4)
        PlatformFolder.PartPlatformTwo.ParticleEmitter.Enabled = false

    elseif PlatformFolder.PartPlatformThree.NumberValue.Value > PlatformFolder.PartPlatformOne.NumberValue.Value and PlatformFolder.PartPlatformThree.NumberValue.Value > PlatformFolder.PartPlatformTwo.NumberValue.Value then
        PlatformFolder.PartPlatformThree.ParticleEmitter.Enabled = true
        task.wait(4)
        PlatformFolder.PartPlatformThree.ParticleEmitter.Enabled = false
    end
end


-- // выбор из декалей кортинку плейса
for _, IndexDecal in next, ScreenFolder:GetChildren() do
    local Stoper = 0
    local TostNum
    repeat
        local NumberRandom = math.random(1,6)
        Stoper += 1
        TostNum = tonumber(NumberRandom)
    until Stoper == 3
    if GameDecal[TostNum] then
        IndexDecal.Decal.Texture = GameDecal[TostNum]
        if not IndexDecal.Decal.Texture == GameDecal[TostNum] then
            IndexDecal.Decal.Texture = GameDecal[TostNum]
        end
    end
end


for _, Index in next, PlatformFolder:GetChildren() do
    local Debounce = false
    local NumberValue = Index.NumberValue
    Index.Touched:Connect(function(Hit)
        if Debounce then return end
        local Player = Players:GetPlayerFromCharacter(Hit.Parent)
        if Player then
            if not Votes[Index.Name][Player.Name] then --// Проверка на голос
                Debounce = true
                --// Очистка старых голосов
                for _, Platform in next, PlatformFolder:GetChildren() do
                    if Votes[Platform.Name][Player.Name] then
                        Votes[Platform.Name][Player.Name] = nil
                        Platform.NumberValue.Value -= 1
                        Platform.NumberGui.TextLabel.Text = Platform.NumberValue.Value
                        Remote.ColorRemote:FireClient(Player, Platform, Color3.fromRGB(165, 153, 156))
                    end
                end

                --// Добавление нового голоса
                Votes[Index.Name][Player.Name] = true
                
                NumberValue.Value += 1
                Index.NumberGui.TextLabel.Text = NumberValue.Value
                Remote.ColorRemote:FireClient(Player, Index, Color3.fromRGB(165, 134, 72))

                local TimerStart = true
                Remote.TimerGameRemote:FireClient(Player,TimerStart) --// запуск таймера после окончания игры(Переместить когда будет телопорт)
                task.wait(10)

                Remote.TimerGameRemote.OnServerEvent:Connect(function(plr,Minetes, Second)
                    if Minetes <= 0 and Second <= 0 then
                        StartEffectVoice()
                    end
                end)
                --// Кулдаун
                task.wait(0.1)
                Debounce = false
            end
        end
        --// Где больше голосов 
       -- if NumberValue.Value >=   then
       --     print()
       -- end
    end)
end


return Framework