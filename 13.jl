using DataStructures
using Combinatorics

open("13.txt") do f
    prefs = DefaultDict{String, Dict{String, Int}}(Dict())
    for l ∈ eachline(f)
        ss = split(strip(l, '.'))
        prefs[ss[1]][ss[11]] = ss[3]=="lose" ? -parse(Int,ss[4]) : parse(Int,ss[4])
    end

    function allseatings(guests)
        # take one random guest
        remaining = collect(guests)
        g1 = pop!(remaining)
        # place every remaining pair around, order not important
        threes = [[g2, g1, g3] for (g2, g3) ∈ combinations(remaining, 2)]
        # seat all threes with all permutations of rest
        seatings = []
        for three ∈ threes
            rest = collect(setdiff(guests, g for g ∈ three))
            for rs ∈ permutations(rest)
                push!(seatings, [three; rs])
            end
        end
        return seatings
    end

    function max_happiness(prefs)
        guests = Set(keys(prefs))
        seatings = allseatings(guests)
        happiness(s) = sum(
            prefs[s[i-1]][s[i]] + prefs[s[i]][s[i-1]] for i ∈ 2:length(s)) +
            prefs[s[1]][s[end]] + prefs[s[end]][s[1]]
        return maximum(happiness.(seatings))   
    end
    println("Part 1: ", max_happiness(prefs))

    for g ∈ keys(prefs)
        prefs[g]["myself"] = 0
        prefs["myself"][g] = 0
    end
    println("Part 2: ", max_happiness(prefs))
end
