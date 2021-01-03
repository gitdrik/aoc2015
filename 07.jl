open("07.txt") do f
    net = Dict{String,Array{String}}(w => split(s) for (s, w) in split.(eachline(f), " -> "))
    known = Dict{String,UInt16}()

    function emulate(w)
        w ∈ keys(known) && return known[w]
        n = tryparse(UInt16, w)
        n != nothing && return n
        ss = net[w]
        if length(ss)==1
            n = emulate(ss[1])
        elseif length(ss)==2
            n = ~emulate(ss[2])
        elseif ss[2] == "LSHIFT"
            n = emulate(ss[1]) << emulate(ss[3])
        elseif ss[2] == "RSHIFT"
            n = emulate(ss[1]) >> emulate(ss[3])
        elseif ss[2] == "AND"
            n = emulate(ss[1]) & emulate(ss[3])
        elseif ss[2] == "OR"
            n = emulate(ss[1]) | emulate(ss[3])
        end
        known[w] = n
        return n
    end
    a = Int(emulate("a"))
    println("Part 1: ", a)

    known = Dict{String,UInt16}("b" => a)
    println("Part 2: ", emulate("a"))
end
