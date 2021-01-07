open("19.txt") do f
    ls = readlines(f)
    rs = [(s[1], s[3]) for s ∈ split.(ls[1:43])]
    m  = ls[45]

    ms = Set{String}()
    for (a,b) ∈ rs
        for p ∈ findall(a, m)
            push!(ms, m[1:p.start-1]*b*m[p.stop+1:end])
        end
    end
    println("Part 1: ", length(ms))

    i = 0
    while m != "e"
        for (a,b) ∈ rs
            i += length(findall(b,m))
            m = replace(m,b=>a)
        end
    end
    println("Part 2: ", i)
end
