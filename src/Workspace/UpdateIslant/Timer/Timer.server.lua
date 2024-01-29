local mFloor = math.floor
local Stop = 0 

while true do task.wait(1)
	task.wait()
	local Time = 1706439600 - tick()  --  1703768400
	local Days = mFloor((Time/60/60/24) %(365 + 0.2425))
	local Hours = mFloor((Time/60/60) % 24)
	local Minutes = mFloor((Time/60) % 60)
	local Seconds = mFloor(Time % 60)

	if Stop == 0 then
		script.Parent.BillboardGui.TextLabel.Text = Days.."Days "..Hours.."Hour "..Minutes.."Min "..Seconds.."Sec "
	end
	if Days == 0 and Hours == 0 and  Minutes == 0 and Seconds == 0 then
		Stop = 1
		--script.Parent.TextOpen.TextLabel.Text = "Open game in:"
		--script.Parent.BillboardGui.TextLabel.Text = "Obby Christmas🎄"
	end
end