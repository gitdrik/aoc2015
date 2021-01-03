open("05.txt") do f
    ls = readlines(f)
    has3wovf(ss) = filter(s->length([c for c ∈ s if c ∈ Set(['a','e','i','o','u'])]) > 2, ss)
    hasrepf(ss) = filter(s->mapreduce(a->a[1]==a[2], |, zip(s,s[2:end])), ss)
    has0badf(ss) = filter(s->any(occursin(a,s) for a ∈ ["ab", "cd", "pq", "xy"]), ss)
    println("Part 1: ", ls |> has3wovf |> hasrepf |> has0badf |> length)

    hasrep2f(ss) = filter(s->any(s[i:i+1]==s[j:j+1] for i ∈ 1:length(s)-3 for j ∈ i:length(s)-1), ss)
    hasx_xf(ss) = filter(s->any(s[i]==s[i+2] for i ∈ 1:length(s)-2), ss)
    println("Part 2: ", ls |> hasrep2f |> hasx_xf |> length)
end
