open("03.txt") do f
    moves = [
        Dict('^' => (0, -1), '>' => (1, 0), '<' => (-1, 0), 'v' => (0, 1))[c]
           for c in readline(f)
    ]
    houses = Set([(0, 0)])
    pos = (0,0)
    for m ∈ moves
        pos = pos .+ m
        push!(houses, pos)
    end
    println("Part 1: ", length(houses))

    houses = Set([(0, 0)])
    santa, robot  = (0, 0), (0, 0)
    for m ∈ moves[1:2:end]
        santa = santa .+ m
        push!(houses, santa)
    end
    for m ∈ moves[2:2:end]
        robot = robot .+ m
        push!(houses, robot)
    end
    println("Part 2: ", length(houses))
end
