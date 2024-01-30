local DroperCoin = {}

local RS = game:GetService('ReplicatedStorage')
local Remote = RS:WaitForChild('Remote')
local TWS = RS:WaitForChild('Libary')
local CoinFolder = game.Workspace.RandomToken

local CollectCoin = 0
for _, index in next, CoinFolder:GetChildren() do
	--как сделать подсчет сколько в цифрах обьктов в папке через скрипт   
    if index:IsA("MeshPart") then
        CollectCoin = CollectCoin + 1
    end
	print(CollectCoin)
    --// дописать до конца
end

return DroperCoin 