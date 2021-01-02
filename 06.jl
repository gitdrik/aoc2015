open("06.txt") do f
    ls = readlines(f)
    lights = falses(1000,1000)
    lights2 = zeros(Int,1000,1000)
    for l ∈ ls
        ws = split(l)
        xl, yl = parse.(Int, split(ws[end-2],',')).+1
        xh, yh = parse.(Int, split(ws[end],',')).+1
        if ws[1] == "toggle"
            lights[xl:xh,yl:yh] = .!lights[xl:xh,yl:yh]
            lights2[xl:xh,yl:yh] = lights2[xl:xh,yl:yh].+2
        elseif ws[2] == "off"
            lights[xl:xh,yl:yh] = falses(xh-xl+1,yh-yl+1)
            lights2[xl:xh,yl:yh] = max.(lights2[xl:xh,yl:yh].-1, 0)
        else
            lights[xl:xh,yl:yh] = trues(xh-xl+1,yh-yl+1)
            lights2[xl:xh,yl:yh] =  lights2[xl:xh,yl:yh].+1
        end
    end
    println("Part 1: ", sum(lights))
    println("Part 2: ", sum(lights2))
end
