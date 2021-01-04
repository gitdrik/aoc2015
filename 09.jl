using DataStructures
open("09.txt") do f
    G = DefaultDict{String,Dict{String, Int}}(Dict())
    for l in eachline(f)
        ss = split(l)
        d = parse(Int, ss[5])
        G[ss[1]][ss[3]], G[ss[3]][ss[1]] = d, d
    end

    d(a, b) = a ∉ keys(G) || b ∉ keys(G[a]) ? 0 : G[a][b]

    alld(pre, cur, places, norm) = d(pre, cur) + (isempty(places) ? 0 :
        norm([alld(cur, nxt, setdiff(places, Set([nxt])), norm) for nxt ∈ places]))

    println("Part 1: ", alld("southpole", "northpole", keys(G), minimum))
    println("Part 2: ", alld("northpole", "southpole", keys(G), maximum))
end
