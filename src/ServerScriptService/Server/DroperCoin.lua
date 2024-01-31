local DroperCoin = {}

local RS = game:GetService('ReplicatedStorage')
local Remote = RS:WaitForChild('Remote')
local TWS = RS:WaitForChild('Libary')
local CoinFolder = game.Workspace.RandomToken:GetChildren()
local Couldown = 5 -- 450
local maxCoins = 5
local CoinSpawn = 0

local CollectCoin = 0

function CountCoins()
    CoinSpawn = 0
    for _, Coin in next, CoinFolder do
        if CoinSpawn == maxCoins then
            if Coin:FindFirstChild("Coin") then
                CoinSpawn += 1
            end 
        end
    end
    return CoinSpawn
end

function CoinSpawner()
    while true do
        local amount = CountCoins()

        if amount <= maxCoins then
            local CoinClone = RS.CoinClone:Clone()
            local RandomSpawn

            repeat
                RandomSpawn = CoinFolder[math.random(1, #CoinFolder)]
            until not RandomSpawn:FindFirstChild('Coin')
            
            CoinClone.Transparency = 0
            CoinClone.Parent = RandomSpawn
            CoinClone.CFrame = RandomSpawn.CFrame + Vector3.new(0,3,0)
            print("Spawn")
        end
        task.wait(Couldown)
    end
end

task.spawn(CoinSpawner)

return DroperCoin 