function firsthousewith(n)
    limit = n ÷ 10
    houses = zeros(Int, limit)
    for elf ∈ 1:limit
        for i ∈ elf:elf:limit
            houses[i] += elf * 10
        end
    end
    return findfirst(p->p ≥ n, houses)
end
println("Part 1: ", firsthousewith(36000000))

function lazyfirsthousewith(n)
    limit = n ÷ 11
    houses = zeros(Int, limit)
    for elf ∈ 1:limit
        for i ∈ elf:elf:min(elf * 50, limit)
            houses[i] += elf * 11
        end
    end
    return findfirst(p->p ≥ n, houses)
end
println("Part 2: ", lazyfirsthousewith(36000000))
