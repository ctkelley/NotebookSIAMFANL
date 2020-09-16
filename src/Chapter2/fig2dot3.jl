function fig2dot3(n = 801, T = Float64)
#
#   Solve the problem and make the figure. The good stuff is
#   in bvp_solve
#
    figout = bvp_solve(n, T)
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
    title("Fig 2.3 in print book")
end
#
"""
bvp_solve

Solve the boundary value problem to make Figure 2.3.
"""
function bvp_solve(n = 801, T = Float64)
    # set it up
    bdata = bvpinit(n, T)
    #
    U0 = zeros(2n)
    FV = zeros(2n)
    FPV = bdata.JacS
    #
    # tv = 0:h:20 is the spatial mesh
    #
    tv = bdata.tv
    #
    # Build the initial iterate
    #
    sv = -.1 * tv .* tv
    v = exp.(sv)
    vp = -.2 * tv .* v
    U0[1:2:2n-1] = v
    U0[2:2:2n] = vp
    #
    # Call the solver. Notice I'm putting my analytic Jacobian evaluation
    # in there.
    #
    bvpout = nsold(Fbvp!, U0, FV, FPV, Jbvp!; rtol = 1.e-10, pdata = bdata)
    return (bvpout = bvpout, tv = tv)
end
