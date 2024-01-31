local DroperCoin = {}
local LocalizationService = game:GetService('LocalizationService')

local RS = game:GetService('ReplicatedStorage')
local Remote = RS:WaitForChild('Remote')
local TWS = RS:WaitForChild('Libary')
local CoinFolder = game.Workspace.RandomToken
local Data = require(script.Parent.Data)
local CounCollect = false
local CC = false
local waitTime = 5

local coinsSpawned = 0

for _, index in next, CoinFolder:GetChildren() do
    if index:IsA('Part') then
        coinsSpawned = coinsSpawned + 1
        local maxCoins = 1
      --  print(coinsSpawned)
        if maxCoins <= coinsSpawned then
            local coinClone = RS.CoinClone:Clone()
			coinClone.Parent = index
            coinClone.Name = 'coinClone'
			coinClone.CFrame = index.CFrame + Vector3.new(0,4,0)
            coinClone.Transparency = 0
			--print("Invite coin")
        end

		local Debounce = false
        index.coinClone.Touched:Connect(function(hit)
			if Debounce then return end
            local Player = game:GetService('Players'):GetPlayerFromCharacter(hit.Parent)
            if Player then
				Debounce = true
                local PData = Data:Get(Player)
				PData.BaseSettings.Sneliki += 1
				print(PData.BaseSettings.Sneliki)
                RS.Remote.TokenClientAnim:FireClient(Player, index.coinClone)
                task.wait(waitTime)
				Debounce = false
                RS.Remote.TokenClientAnimTwo:FireClient(Player, index.coinClone)      
            end
        end)
    end 
end

return DroperCoin 