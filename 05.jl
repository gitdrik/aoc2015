open("05.txt") do f
    ls = readlines(f)
    has3wovf(ss) = filter(s->length([c for c in s if c ∈ Set(['a','e','i','o','u'])]) > 2, ss)
    hasrepf(ss) = filter(s->mapreduce(a->a[1]==a[2], |, zip(s,s[2:end])), ss)
    has0badf(ss) = filter(s->mapreduce(a->string(a...) ∉ Set(["ab", "cd", "pq", "xy"]), &, zip(s,s[2:end])), ss)
    println("Part 1: ", ls |> has3wovf |> hasrepf |> has0badf |> length)

    function hasrep2(s)
        for i ∈ 1:length(s)-3, j ∈ i+2:length(s)-1
            s[i:i+1] == s[j:j+1] && return true
        end
        return false
    end
    function hasx_x(s)
        for i ∈ 1:length(s)-2
            s[i] == s[i+2] && return true
        end
        return false
    end
    hasrep2f(ss) = filter(s->hasrep2(s), ss)
    hasx_xf(ss) = filter(s->hasx_x(s), ss)
    println("Part 2: ", ls |> hasrep2f |> hasx_xf |> length)
end
