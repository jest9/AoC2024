var = 0
safe_count = 0

function creasing(b)
    if #b < 2 then
        return "SAFE"
    end

    local is_increasing = nil

    for i = 1, #b - 1 do
        if b[i] < b[i + 1] then
            -- increasing
            if is_increasing == false then
                return "borked"
            end
            is_increasing = true
        elseif b[i] > b[i + 1] then
            -- decreasing
            if is_increasing == true then
                return "borked"
            end
            is_increasing = false
        else

            return "borked"
        end
    end

    var = var + 1
    return "SAFE"
end

function spacing(a)
    for i = 1, #a - 1 do
        if math.abs(a[i] - a[i + 1]) > 3 then
            return "borked"
        end
    end
    return "passed"
end

-- part 2

function is_safe_with_one_removal(list)
    local n = #list
    for i = 1, n do

        local reduced_list = {}
        for j = 1, n do
            if j ~= i then
                table.insert(reduced_list, list[j])
            end
        end

        if spacing(reduced_list) == "passed" and creasing(reduced_list) == "SAFE" then
            return true
        end
    end
    return false
end

file = io.open("list.txt", "r")
if not file then
    print("Error: Could not open file.")
    return
end

local t = {}
for line in file:lines() do
    for str in string.gmatch(line, "%S+") do
        table.insert(t, tonumber(str))
    end

    if #t > 0 then
        print("Processing list: " .. table.concat(t, ", "))

        local spacing_result = spacing(t)
        local creasing_result = creasing(t)

        if spacing_result == "passed" and creasing_result == "SAFE" then
            print("Result: SAFE")
            safe_count = safe_count + 1
        elseif is_safe_with_one_removal(t) then
            print("Result: SAFE (one bad level tolerated)")
            safe_count = safe_count + 1
        else
            print("Result: borked")
        end
    end
    t = {} 
end

file:close()

print(safe_count)
