function fight()
    #[health, cost, damage, armor]
    boss    = [104, 0, 8, 1]
    player  = [100, 0, 0, 0]
    #[cost, damage, armor]
    wepons = [[  8, 4, 0],
              [ 10, 5, 0],
              [ 25, 6, 0],
              [ 40, 7, 0],
              [ 74, 8, 0]]
    armor  = [[  0, 0, 0],
              [ 13, 0, 1],
              [ 31, 0, 2],
              [ 53, 0, 3],
              [ 75, 0, 4],
              [102, 0, 5]]
    rings  = [[  0, 0, 0],
              [  0, 0, 0],
              [ 25, 1, 0],
              [ 50, 2, 0],
              [100, 3, 0],
              [ 20, 0, 1],
              [ 40, 0, 2],
              [ 80, 0, 3]]
    mincost = 500
    for w ∈ wepons, a ∈ armor, r1 ∈ rings, r2 ∈ [r for r ∈ rings if r ≠ r1]
        player[2:end] = w .+ a .+ r1 .+ r2
        playersurvival = cld(player[1], max(boss[3]-player[4], 1))
        bosssurvival = cld(boss[1], max((player[3]-boss[4]), 1))
        if player[2] < mincost && playersurvival ≥ bosssurvival
            mincost = player[2]
        end
    end
    println("Part 1: ", mincost)
    maxcost = 0
    for w ∈ wepons, a ∈ armor, r1 ∈ rings, r2 ∈ [r for r ∈ rings if r ≠ r1]
        player[2:end] = w .+ a .+ r1 .+ r2
        playersurvival = cld(player[1], max(boss[3]-player[4], 1))
        bosssurvival = cld(boss[1], max((player[3]-boss[4]), 1))
        if player[2] > maxcost && playersurvival < bosssurvival
            maxcost = player[2]
        end
    end
    println("Part 2: ", maxcost)
end
fight()
