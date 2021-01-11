function bossfight()
    #            [cost, mana, heal, dmge, shld, time ]
    spellshop = [[  53,    0,    0,    4,    0,    1 ], # Magic Missile
                 [  73,    0,    2,    2,    0,    1 ], # Drain
                 [ 113,    0,    0,    0,    7,    6 ], # Shield
                 [ 173,    0,    0,    3,    0,    6 ], # Poison
                 [ 229,  101,    0,    0,    0,    5 ]] # Recharge

    boss, player, mana = 55, 50, 500

    function play(boss, player, spells, mana, playersturn, cost, maxcost, hardmode)
        cost ≥ maxcost && return typemax(Int)
        if hardmode && playersturn
            player -= 1
            player ≤ 0 && return typemax(Int)
        end
        if !isempty(spells)
            mana   += sum([s[2] for s in spells])
            player += sum([s[3] for s in spells])
            boss   -= sum([s[4] for s in spells])
            shield  = sum([s[5] for s in spells])
            spells = filter( s->s[6]>1, spells)
            spells = [[s[1:5];[s[6]-1]] for s ∈ spells]
        end
        boss ≤ 0 && return cost
        if playersturn
            castable = filter(s -> s[1] ≤ mana && all(s[1] ≠ a[1] for a ∈ spells), spellshop)
            isempty(castable) && return typemax(Int)
            for s ∈ castable
                c = play(boss, player, deepcopy([spells;[s]]), mana-s[1], false, cost+s[1], maxcost, hardmode)
                maxcost = min(maxcost, c)
            end
            return maxcost
        else
            player -= 8-shield
            player ≤ 0 && return typemax(Int)
            return play(boss, player, spells, mana, true, cost, maxcost, hardmode)
        end
    end
    println("Part 1: ", play(boss, player, [], mana, true, 0, typemax(Int), false))
    println("Part 2: ", play(boss, player, [], mana, true, 0, typemax(Int), true))
end
bossfight()
