function BVPsolution(n = 801, T = Float64, printlabel = true)
    #
    #   Solve the problem and make the figure. The good stuff is
    #   in bvp_solve
    #
    figout = BVP_solve(n, T; bfact = qr!)
    bvpout = figout.bvpout
    tv = figout.tv
    vlabel = L"$v$"
    vplabel = L"$v'$"
    v = bvpout.solution[1:2:2n-1]
    vp = bvpout.solution[2:2:2n]
    plot(tv, v, "k-", tv, vp, "k--")
    legend((vlabel, vplabel))
    axis([0, 20, -1.5, 2.5])
    xticks(collect(0:2:20))
    ~printlabel || title("Fig 2.3 in print book")
end
