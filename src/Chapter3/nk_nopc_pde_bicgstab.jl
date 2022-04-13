"""
nk_nopc_pde_bicgstab(printlabel = true)

Solve the convection-diffusion equation using nsoli.jl on an n x n grid. 
with Newton_GMRES and Newton-BiCGSTAB

Unpreconditioned example.
"""
function nk_nopc_pde_bicgstab(printlabel = true)
    fpsize=fsize(printlabel)
    # Get some room for the residual
    n = 31
    u0 = zeros(n * n)
    FV = copy(u0)
    FVS = copy(u0)
    # Storage for the Jacobian-vector products
    JV = zeros(n * n, 3)
    JVL = zeros(n * n, 25)
    # Get the precomputed data from pdeinit
    pdata = pdeinit(n)
    rtol = 1.e-7
    atol = 1.e-10
    etamax = 0.1
    fixedeta = false
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
    #
    # Call the solver with a finite-difference Jac-Vec, FFT preconditioner
    # with GMRES, GMRES(2), and BiCGSTAB as the linear solvers
    #
    legend(["Gmres", "BiCGSTAB", "GMRES(2)"])
    poutg = nsoli( pdeF!, u0, FV, JVL; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 100)
    nl_stats!(plot_hist, poutg, "GMRES"; method=:nkj)
    poutb = nsoli( pdeF!, u0, FV, FVS; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 100, 
        lsolver = "bicgstab")
    nl_stats!(plot_hist, poutb, "BiCGSTAB"; method=:nkj)
    poutgl = nsoli( pdeF!, u0, FV, JV; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 100)
    nl_stats!(plot_hist, poutgl, "GMRES(2)"; method=:nkj)
    #
    # Collect the iteration statistics and make the plots
    #
    printlabel ? (caption = "Fig 3.8 in print book") : (caption = nothing)
    plot_its_funs(plot_hist, caption; method=:nkj, fpsize=fpsize)
    return (poutg = poutg, poutgl = poutgl, poutb = poutb)
end
