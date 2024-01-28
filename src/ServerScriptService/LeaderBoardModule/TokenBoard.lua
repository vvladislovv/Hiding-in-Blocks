local DSS = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local LeaderboardFolder = workspace.Leadebord.SceedBorad.TokenBoard
local DataSave = require(script.Parent.Parent.Server.Data)
local LeaderStore = DSS:GetOrderedDataStore("TestAlifa135")
local AdminTable = require(game.ReplicatedStorage.Libary.TableAdminUser)

local Holder = LeaderboardFolder.SurfaceGui:WaitForChild("Holder")
local Template = script:WaitForChild("Template")

local TokenModule = {}

local function ClearBoard()
	for _, T in pairs(Holder:GetChildren()) do
		if not T:IsA("UIListLayout") then
			T:Destroy()
		end
	end
end
local function UpdateBoard()
	local Pages = LeaderStore:GetSortedAsync(false, 100)
	local TopTen = Pages:GetCurrentPage()
	ClearBoard()
	task.wait()
	for Key, Value in pairs(TopTen) do
		local PlayerName = Players:GetNameFromUserIdAsync(Value.key)
		if Value.value > 0 then
			local NewPlayer = Template:Clone()
			NewPlayer.Parent = Holder
			if Key == 1 then
				NewPlayer.BackgroundColor3 = Color3.fromRGB(130, 236, 255)
			elseif Key == 2 then
				NewPlayer.BackgroundColor3 = Color3.fromRGB(255, 223, 142)
			elseif Key == 3 then
				NewPlayer.BackgroundColor3 = Color3.fromRGB(214, 214, 214)
			else
				local r = math.random(1,2)
				if r == 1 then 
					NewPlayer.BackgroundColor3 = Color3.fromRGB(73, 73, 73)
					NewPlayer.Player.UIStroke.Enabled = true
					NewPlayer.Coins.UIStroke.Enabled = true
					NewPlayer.Rank.UIStroke.Enabled = true
					NewPlayer.Player.TextColor3 = Color3.new(255,255,255)
					NewPlayer.Coins.TextColor3 = Color3.new(255,255,255)
					NewPlayer.Rank.TextColor3 = Color3.new(255,255,255)
				else
					NewPlayer.BackgroundColor3 = Color3.fromRGB(109, 84, 69)
					NewPlayer.Player.UIStroke.Enabled = true
					NewPlayer.Coins.UIStroke.Enabled = true
					NewPlayer.Rank.UIStroke.Enabled = true
					NewPlayer.Player.TextColor3 = Color3.new(255,255,255)
					NewPlayer.Coins.TextColor3 = Color3.new(255,255,255)
					NewPlayer.Rank.TextColor3 = Color3.new(255,255,255)
					--NewPlayer.Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
			NewPlayer.Player.Text = PlayerName
			NewPlayer.Rank.Text = Key.."."
			NewPlayer.Coins.Text = Value.value
		end
	end
end

task.spawn(function()
	while true do
		for _, Player in pairs(Players:GetPlayers()) do
			local PData = DataSave:Get(Player)
			local Currency = PData.BaseSettings.CollectPassToken
			if not AdminTable[Player.Name] then
				LeaderStore:SetAsync(Player.UserId, math.floor(Currency))
			else
				LeaderStore:SetAsync(Player.UserId,0)
			end
		end
		UpdateBoard()
		task.wait(1)
	end
end)

return TokenModule