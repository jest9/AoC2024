local numain = 0

local file = io.open("list.txt", "r")
if not file then
    print("Error opening file!")
    return
end

local files = file:read("*all")
file:close()

local pattern1 = "don't%(.-do%(%)"
local pattern2 = "mul%((%d+),(%d+)%)"

local result = string.gsub(files, pattern1, "")

for num1, num2 in result:gmatch(pattern2) do
    local get = num1 * num2
    numain = numain + get
end


print(result)
print(numain)
