function firsthousewith(n)
    hilimit = n ÷ 10
    houses = ones(Int, hilimit)
    for elf ∈ 2:hilimit
        for i ∈ elf:elf:hilimit
            houses[i] += elf * 10
        end
    end
    return findfirst(p->p ≥ n, houses)
end
println("Part 1: ", firsthousewith(36000000))

function lazyfirsthousewith(n)
    hilimit = n ÷ 11
    houses = zeros(Int, hilimit)
    for elf ∈ 1:hilimit
        for i ∈ elf:elf:min(elf * 50, hilimit)
            houses[i] += elf * 11
        end
    end
    return findfirst(p->p ≥ n, houses)
end
println("Part 2: ", lazyfirsthousewith(36000000))
