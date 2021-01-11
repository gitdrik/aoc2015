open("23.txt") do f
    code = split.(replace.(readlines(f),","=>""))
    function run(regs)
        i = 1
        while i ≤ length(code)
            inc = 1
            if code[i][1] == "hlf"
                regs[code[i][2]] ÷= 2
            elseif code[i][1] == "tpl"
                regs[code[i][2]] *= 3
            elseif code[i][1] == "inc"
                regs[code[i][2]] += 1
            elseif code[i][1] == "jmp"
                inc = parse(Int, code[i][2])
            elseif code[i][1] == "jie" && iseven(regs[code[i][2]])
                inc = parse(Int, code[i][3])
            elseif code[i][1] == "jio" && regs[code[i][2]] == 1
                inc = parse(Int, code[i][3])
            end
            i += inc
        end
        return regs
    end
    println("Part 1: ", run(Dict("a"=>0, "b"=>0))["b"])
    println("Part 2: ", run(Dict("a"=>1, "b"=>0))["b"])
end
