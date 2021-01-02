open("01.txt") do f
    moves = [c=='(' ? 1 : -1 for c in readline(f)]
    println("Part 1: ", sum(moves))
    
    floor = 0
    for (i, m) ∈ enumerate(moves)
        floor += m
        if floor == -1
            println("Part 2: ", i)
            break
        end
    end
end
