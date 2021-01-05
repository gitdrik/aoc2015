valid(cs) = !any(c ∈ ['i','o','l'] for c in cs) &&
             any(cs[i]==cs[i+1]-1==cs[i+2]-2 for i ∈ 1:length(cs)-2) &&
             any(cs[i]==cs[i+1] && cs[j]==cs[j+1] for i ∈ 1:length(cs)-3 for j ∈ i+2:length(cs)-1)

function next(s)
    cs = [c for c in s]
    while true
        for i ∈ 8:-1:1
            cs[i] += 1
            cs[i] != '{' && break
            cs[i] = 'a'
        end
        valid(cs) && break
    end
    String(cs)
end

nxt = next("vzbxkghb")
println("Part 1: ", nxt)
println("Part 2: ", next(nxt))
