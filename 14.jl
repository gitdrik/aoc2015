open("14.txt") do f
    raindeers = [
        # 1:name, 2:speed [km/s], 3:move time [s], 4:rest time [s], 5:cycle time [s]
        [ws[1], parse(Int,ws[4]), parse(Int,ws[7]), parse(Int,ws[14]), parse(Int,ws[7])+parse(Int,ws[14])]
            for ws ∈ split.(eachline(f))]

    dist(t, deer) = deer[2]*(t÷deer[5]*deer[3] + min(t % deer[5], deer[3]))
    println("Part 1: ", maximum(dist.(2503, raindeers)))

    points = [0 for _ ∈ raindeers]
    for t ∈ 1:2503
        dists = dist.(t, raindeers)
        points += dists .== maximum(dists)
    end
    println("Part 2: ", maximum(points))
end
