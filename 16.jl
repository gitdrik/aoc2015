open("16.txt") do f
    int(s) = parse(Int,s)
    aunts = readlines(f) |> l->replace.(l,":"=>"") |>
            l->replace.(l,","=>"") |> l->split.(l) |>
            ss->[Dict(s[3]=>int(s[4]),s[5]=>int(s[6]),s[7]=>int(s[8])) for s in ss]
    M = Dict("children"=>3, "cats"=>7, "samoyeds"=>2,
             "pomeranians"=>3, "akitas" => 0, "vizslas"=>0,
             "goldfish"=>5, "trees"=>3, "cars"=>2, "perfumes"=>1)

    test1(a) = keys(a) ⊆ keys(M) && all(a[k]==M[k] for k in keys(a))
    println("Part 1: ", findfirst(test1, aunts))

    function test2(a)
        !(keys(a) ⊆ keys(M)) && return false
        for k ∈ keys(a)
            if k ∈ ["cats", "trees"]
                a[k] ≤ M[k] && return false
            elseif k ∈ ["pomeranians", "goldfish"]
                a[k] ≥ M[k] && return false
            else
                a[k] ≠ M[k] && return false
            end
        end
        return true
    end
    println("Part 1: ", findfirst(test2, aunts))
end
