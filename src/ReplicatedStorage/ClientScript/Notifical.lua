local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild('PlayerGui')
local TWS = require(game.ReplicatedStorage.Libary.TweenService)

local UI = PlayerGui:WaitForChild('UI')

local Noffical = {}

function Noffical:NewQuest(NPC)
    UI.FrameQuest.TextLabel.Text = "You have a new quest at "..NPC.."!"
    TWS:NofficallOpen(UI.FrameQuest)
    task.wait(5)
    TWS:NofficallClose(UI.FrameQuest)
    UI.FrameQuest.TextLabel.Text = ""
end

function Noffical:ComplishQuset(NPC, TaskQuset)
    local function QuestTask(TaskQuset) -- // Надо запустить
        local Clone = UI.FrameQuest:Clone()
        print(TaskQuset)
        for _, Task in pairs(TaskQuset) do
            print(#Task)
        end
        QuestTask(TaskQuset)
        TWS:NofficallOpen(UI.FrameQuest)
    end
    UI.FrameQuest.TextLabel.Text = "You have completed the quest at "..NPC.."!"
    TWS:NofficallOpen(UI.FrameQuest)
    task.wait(5)
    TWS:NofficallClose(UI.FrameQuest)
    UI.FrameQuest.TextLabel.Text = ""
end

return Noffical