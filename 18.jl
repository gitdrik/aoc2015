open("18.txt") do f
    G = falses(102,102)
    for (i,l) ∈ enumerate(eachline(f))
        G[i+1,:] = [[0];[c=='#' for c ∈ l];[0]]
    end
    G2 = deepcopy(G)
    G2[101,2] = 1
    for t ∈ 1:100
        nG, nG2  = deepcopy(G), deepcopy(G2)
        for i ∈ 2:101, j ∈ 2:101
            n = sum(G[i-1:i+1, j-1:j+1])-G[i,j]
            n2 = sum(G2[i-1:i+1, j-1:j+1])-G2[i,j]
            if n == 3 && !G[i,j] || G[i,j] && n ∉ [2,3]
                nG[i,j] = !G[i,j]
            end
            if n2 == 3 && !G2[i,j] || G2[i,j] && n2 ∉ [2,3]
                nG2[i,j] = !G2[i,j]
            end
        end
        G, G2 = nG, nG2
        G2[2,2], G2[101,2], G2[2,101], G2[101,101] = 1, 1, 1, 1
    end
    println("Part 1: ", sum(G))
    println("Part 2: ", sum(G2))
end
