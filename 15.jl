open("15.txt") do f
    M = Array{Int}(undef, 5, 4)
    int(s) = parse(Int, s)
    for (i,l) ∈ enumerate(readlines(f))
        ws = split(replace(l, ","=>""))
        M[:,i] = [int(ws[3]), int(ws[5]), int(ws[7]), int(ws[9]), int(ws[11])]
    end

    best = 0
    for i ∈ 0:100, j ∈ 0:100-i, k ∈ 0:100-i-j, l ∈ 100-i-j-k
        points = prod(max.(M[1:4,:]*[i, j, k, l], 0))
        best = max(best, points)
    end
    println("Part 1: ", best)

    best = 0
    for i ∈ 0:100, j ∈ 0:100-i, k ∈ 0:100-i-j, l ∈ 100-i-j-k
        if M[5:5,:]*[i, j, k, l] == [500]
            points = prod(max.(M[1:4,:]*[i, j, k, l], 0))
            best = max(best, points)
        end
    end
    println("Part 2: ", best)
end
