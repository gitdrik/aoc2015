using Combinatorics
open("17.txt") do f
    cs = parse.(Int, eachline(f))
    println("Part 1: ", sum(sum.(combinations(cs)) .== 150))
    println("Part 2: ", sum(sum.(combinations(cs, 4)) .== 150))
end
