open("08.txt") do f
    ls = readlines(f)
    decode(s) = eval.(Meta.parse.(s))
    println("Part 1: ", sum(length.(ls)-length.(decode.(ls))))
    encode(s) = "\"" * replace(replace(s, "\\"=>"\\\\" ), "\""=>"\\\"") * "\""
    println("Part 2: ", sum(length.(encode.(ls)) - length.(ls)))
end
