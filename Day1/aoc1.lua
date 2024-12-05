local numbers = {}

local list1 = {}
local list2 = {}

local listdone = {}

file = io.open("list.txt","r")
for line in file:lines() do
    table.insert(numbers, line)
end
file:close()

local split_data = {}

for _, entry in ipairs(numbers) do
    for part in string.gmatch(entry, "%S+") do
        table.insert(split_data, part)
    end
end

for i, value in ipairs(split_data) do
    if i % 2 ~= 0 then
        table.insert(list1, value)
    else
        table.insert(list2, value)
    end
end

table.sort(list1)
table.sort(list2)

for i, value1 in ipairs(list1) do
    local index = i
    local num = list2[i]
    local g = math.abs(num-value1)
    table.insert(listdone, g)
end

local val = 0
for _, v in ipairs(listdone) do
    val = val + v
end




-- Part 2

local amount = {}

for i, v in ipairs(list1) do
    local test = 0
    for y, x in ipairs(list2) do
        if v == x then
            test = test + 1
        end
    end
    table.insert(amount, test)
end

local sum = {}

local val = 0
for i, v in ipairs(list1) do
    local get = amount[i]
    local res = v*get
    table.insert(sum, res)
end

local val = 0
for _, v in ipairs(sum) do
    val = val + v
end
