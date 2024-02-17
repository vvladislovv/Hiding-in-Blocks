local Utils = {}

local Prefix = {"","k","M","B","T","qd"}

function Utils:Prefix(Num) --! Сокращение 
    --print(Num)
    for i = 1, #Prefix do
        if Num < 10 ^ (i*3) then
            return math.floor(Num / ((10 ^ ((i - 1) * 3)) / 100)) / (100) .. Prefix[i]
        end
    end
end

function Utils:CommaNumber(Num) -- ! Раздел на милионы и тп
    --print(Num)
    Num = tostring(Num)
    return Num:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end


function Utils:GetTableNum(Table, Type)
    local v1 = 0

    for i, Challenge in pairs(Table) do
        --print(Challenge)
        v1 += Challenge[Type]
    end
    --print(v1)
    return v1
end

function Utils:DeepCopy(Table)
    local Clone = {}
    
    for key, value in pairs(Table) do
        if typeof(value) == "table" then
            Clone[key] = Utils:DeepCopy(value)
        else
            Clone[key] = value
        end
    end

    return Clone
end

return Utils