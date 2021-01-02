using MD5
function mine(n)
    for i ∈ Iterators.countfrom(1)
        bytes2hex(md5(string("ckczppom", i)))[1:n] == repeat("0",n) && return i
    end
end
println("Part 1: ", mine(5))
println("Part 2: ", mine(6))
