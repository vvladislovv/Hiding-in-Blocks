local Server = game.ServerScriptService.LeaderBoardModule

for _, index in next, Server:GetDescendants() do
    if index:IsA('ModuleScript') then
        require(index)
    end
end


