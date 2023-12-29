"""
function threewaystagnationv2()

This is the Julia code for the tan(x) = x example.

This code makes the restrained version of Figure 1.3
in the print book.

See the notebook.

"""
function threewaystagnationv2()
    kwnewt = (maxit = 14, rtol = 1.e-17, atol = 1.e-17, printerr = false)
    kwchord = (maxit = 14, rtol = 1.e-17, atol = 1.e-17, printerr = false, solver = "chord")
    kwsec = (maxit = 6, rtol = 1.e-17, atol = 1.e-17, printerr = false)
    nnout = nsolsc(x -> tan(x) - x, 4.5; kwnewt...)
    lnn = length(nnout.history)
    nncounter = 0:lnn-1
    chout = nsolsc(x -> tan(x) - x, 4.5; kwchord...)
    lnc = length(chout.history)
    nccounter = 0:lnc-1
    scout = secant(x -> tan(x) - x, 4.5; kwsec...)
    lns = length(scout.history)
    sccounter = 0:lns-1
    semilogy(
        nncounter,
        nnout.history,
        "k-",
        nccounter,
        chout.history,
        "k--",
        sccounter,
        scout.history,
        "k-.",
    )
    ylabel("Log Absolute Nonlinear Residual")
    xlabel("Nonlinear Iterations")
    legend(("Newton", "Chord", "Secant"))
    title("Figure 1.10 in print book")
    #title("More restrained version of Figure 1.3")
    #return nnout
end
