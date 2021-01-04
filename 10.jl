function say(look)
    isempty(look) && return look
    seq, i, last = [], 1, look[1]
    for n ∈ look[2:end]
        if n==last
            i += 1
            continue
        end
        push!(seq, i, last)
        i, last = 1, n
    end
    push!(seq, i, last)
    return seq
end

function multisaylength(look, n)
    for i ∈ 1:n
        look = say(look)
    end
    return length(look)
end
seed = [1,3,2,1,1,3,1,1,1,2]
println("Part 1: ", multisaylength(seed, 40))
println("Part 2: ", multisaylength(seed, 50))
