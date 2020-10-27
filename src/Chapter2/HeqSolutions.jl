"""
HeqSolutions(printlabel=true)
Draw Fig 2.2 in the print book.
"""
function HeqSolutions(printlabel=true)
    n = 100
    c = 0.9
    x0 = ones(n)
    #
    #   Build the structure with the precomputed data.
    #
    hdata = heqinit(x0, c)
    #
    #   Allocate the room for the residual and Jacobian.
    #
    FS = ones(n)
    FPS = ones(n, n)
    #
    #   Call the solver twice.
    #
    nsolout9 = nsol(heqf!, x0, FS, FPS; sham=1,
             rtol = 1.e-10, atol = 1.e-10, pdata = hdata)
    #   Change c to .5
    setc!(hdata,.5)
    nsolout5 = nsol(heqf!, x0, FS, FPS; sham=1,
             rtol = 1.e-10, atol = 1.e-10, pdata = hdata)
    #
    # Showtime! Make the plot.
    #
    axis([0, 1.0, 1.0, 1.9])
    mu = hdata.mu
    H9 = nsolout9.solution
    H5 = nsolout5.solution
    plot(mu, H9, "k-", mu, H5, "k--")
    xlabel(L"\mu")
    ylabel(L"H(\mu)")
    legend(["c=.9", "c=.5"])
    ~printlabel || title("Fig 2.2 from print book")
end
