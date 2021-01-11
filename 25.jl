function code(row, col)
    n = ((row+col-1)^2 + row+col-1) ÷ 2 - row + 1
    code = 20151125
    for _ ∈ 2:n
         code = code * 252533 % 33554393
    end
    return code
end
println("Day 25: ", code(2947, 3029))
