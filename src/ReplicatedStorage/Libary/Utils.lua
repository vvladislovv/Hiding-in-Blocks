local Utils = {}

function Utils:Prefix(Num) --! Сокращение 
    local Prefix = {"","k","M","B","T","qd"}
    
    for i = 1, #Prefix do
        if Num < 10 ^ (i*3) then
            return math.floor(Num / ((10 ^ ((i - 1) * 3)) / 100)) / (100) .. Prefix[i]
        end
    end
end

function Utils:CommaNumber(Num) -- ! Раздел на милионы и тп
    Num = tostring(Num)
    return Num:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

return Utils