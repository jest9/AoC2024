local numain = 0
mrclock = os.clock()

local blinks = 25
local t = {}

function init()
    file = io.open("list.txt", "r")
    for lines in file:lines() do
        for i in string.gmatch(lines, "%S+") do
            local int = tonumber(i)
            table.insert(t, int)
        end
    end
    file:close()
end

init()

for var = 1, blinks do
    numain = numain + 1
    print(#t)
    print("We are on iteration " .. numain)
    local new_t = {}
    for i, v in ipairs(t) do
        local len = math.floor(math.log10(v) + 1)

        if v == 0 then
            table.insert(new_t, 1)

        elseif len % 2 == 0 then

            local str = tostring(v)
            local mid = math.floor(len / 2)
            local first_part = tonumber(str:sub(1, mid))
            local second_part = tonumber(str:sub(mid + 1))
            
            if second_part == nil then
               second_part = 0
               print("used")
            end

            table.insert(new_t, first_part)
            table.insert(new_t, second_part)
        elseif len % 2 ~= 0 then

            local letsgo2024 = v * 2024
            table.insert(new_t, letsgo2024)
        end
    end
    t = new_t
end


print(#t)
print("Execution time is: " .. os.clock() - mrclock)

-- part 2 : HAHAHAHAHAHAHAHA WHAT
