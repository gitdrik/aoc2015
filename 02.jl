open("02.txt") do f
    boxes = [sort(parse.(Int, split(l,'x'))) for l in eachline(f)]
    area(b) = 3b[1]b[2] + 2(b[1]b[3] + b[2]b[3])
    println("Part 1: ", sum(area.(boxes)))
    ribbon(b) = 2(b[1] + b[2]) + prod(b)
    println("Part 2: ", sum(ribbon.(boxes)))
end
