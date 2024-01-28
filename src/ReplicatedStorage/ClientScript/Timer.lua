local TimerGame = {}

local Player = game:GetService("Players").LocalPlayer:WaitForChild('PlayerGui')
local TimerText = Player:WaitForChild('TimerLooby').TextLabel

game.ReplicatedStorage:WaitForChild('Remote'):WaitForChild('TimerGameRemote').OnClientEvent:Connect(function(TimerStart)
    if TimerStart then
        local Minetes = 0
        local Second = 10

        repeat
            if Second <= 0 then
                Minetes = Minetes - 1
                Second = 59
            else
                Second = Second - 1
            end
    
            if Second < 10 then
                TimerText.Text = tostring(Minetes)..":0"..tostring(Second)
            else
                TimerText.Text = tostring(Minetes)..":"..tostring(Second)
            end
            --print(TimerText.Text)
            task.wait(1)
        until Minetes <= 0 and Second <= 0
        game.ReplicatedStorage:WaitForChild('Remote'):WaitForChild('TimerGameRemote'):FireServer(Minetes, Second)
    end
end)

return TimerGame