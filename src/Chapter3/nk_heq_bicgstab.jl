"""
nk_heq_bicgstab(printlabel = true)

Compare Newton-GMRES to Newton-BiCGSTAB for the H-equation
"""
function nk_heq_bicgstab(printlabel = true)
    n = 100
    #
    # Preallocated storage
    #
    u0 = zeros(n)
    FS = zeros(n)
    FV = zeros(n)
    FPS = ones(n, 20)
    FPSS = ones(n, 3)
    #
    # Get organized
    #
    c = 0.9
    atol = 1.e-10
    rtol = 1.e-10
    hdata = heqinit(u0, c)
    etamax = 0.1
    fixedeta = false
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
    plot_hist = Vector{Data_4_Plots}()
    #
    # Use GMRES, GMRES(2), and BiCGSTAB
    #
    koutg = nsoli( heqf!, u0, FS, FPS; pdata = hdata, rtol = rtol, atol = atol,
        lmaxit = 40, eta = etamax, fixedeta = fixedeta)
    nl_stats!(plot_hist, koutg, "GMRES"; method=:nkj)
    koutb = nsoli( heqf!, u0, FS, FV; pdata = hdata, rtol = rtol, atol = atol,
        lmaxit = 40, eta = etamax, lsolver = "bicgstab", 
        fixedeta = fixedeta)
    nl_stats!(plot_hist, koutb, "BiCGSTAB"; method=:nkj)
    koutgs = nsoli( heqf!, u0, FS, FPSS; pdata = hdata, rtol = rtol, 
         atol = atol, lmaxit = 40, eta = etamax, fixedeta = fixedeta)
    nl_stats!(plot_hist, koutgs, "GMRES(2)"; method=:nkj)
    printlabel ? (caption = "Fig 3.6 in print book") : (caption = nothing)
    plot_its_funs(plot_hist, caption; method=:nkj)
    return (koutb = koutb, koutg = koutg)
end
