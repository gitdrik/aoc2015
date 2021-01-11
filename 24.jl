using Combinatorics
open("24.txt") do f
    function divide(pkgs, massratio)
        n, m = length(pkgs), sum(pkgs)÷massratio
        for i ∈ 1:n, ps ∈ combinations(1:n, i)
            sum(pkgs[ps]) == m && return prod(pkgs[ps])
        end
    end
    pkgs = reverse(parse.(Int, readlines(f)))
    println("Part 1: ", divide(pkgs, 3))
    println("Part 2: ", divide(pkgs, 4))
end
