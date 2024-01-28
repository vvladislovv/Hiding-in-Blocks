local RS = game:GetService("ReplicatedStorage")
local CS = RS:WaitForChild('ClientScript')


for _, index in next, CS:GetDescendants() do
    if index:IsA('ModuleScript') then
        require(index)
    end
end
