open("14.txt") do f
    int(s) = parse(Int, s)
    # 1:name, 2:speed [km/s], 3:move time [s], 4:rest time [s], 5:cycle time [s]
    raindeers = [[ws[1], int(ws[4]), int(ws[7]), int(ws[14]), int(ws[7]) + int(ws[14])]
            for ws ∈ split.(eachline(f))]

    dist(t, deer) = deer[2] * (t ÷ deer[5] * deer[3] + min(t % deer[5], deer[3]))
    println("Part 1: ", maximum(dist.(2503, raindeers)))

    points = [0 for _ ∈ raindeers]
    for t ∈ 1:2503
        dists = dist.(t, raindeers)
        points += dists .== maximum(dists)
    end
    println("Part 2: ", maximum(points))
end
