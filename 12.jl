using JSON
open("12.txt") do f
    l = readline(f)
    n, cs = 0, ""
    for c ∈ l
        if c ∈ Set(['0':'9'...,'-'])
            cs = string(cs, c)
            continue
        elseif cs != ""
            n += parse(Int, cs)
            cs = ""
        end
    end
    println("Part 1: ", n)

    data = JSON.parse(l)
    function countnotred(data)
        typeof(data) == Int64 && return data
        typeof(data) == Array{Any,1} && return sum(countnotred.(data))
        typeof(data) == Dict{String,Any} && "red" ∉ values(data) && return sum(countnotred.(values(data)))
        return 0
    end
    println("Part 2: ", countnotred(data))
end
