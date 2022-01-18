"""
nk_pde_bicgstab(printlabel = true)

Solve the convection-diffusion equation using nsoli.jl on an n x n grid. 
with Newton_GMRES and Newton-BiCGSTAB
"""
function nk_pde_bicgstab(printlabel = true)
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
    fignum="3.7"
    #
    # Call the solver with a finite-difference Jac-Vec, FFT preconditioner
    # with GMRES, GMRES(2), and BiCGSTAB as the linear solvers
    #
    poutg = nsoli( pdeF!, u0, FV, JVL; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 20, 
        Pvec = Pvec2d)
nl_stats!(plot_hist, poutg, "GMRES"; method=:nkj)
#
    poutb = nsoli( pdeF!, u0, FV, FVS; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 20,
        Pvec = Pvec2d, lsolver = "bicgstab")
nl_stats!(plot_hist, poutb, "BiCGSTAB"; method=:nkj)
#
    poutgl = nsoli( pdeF!, u0, FV, JV; rtol = rtol, atol = atol, pdata = pdata,
        eta = etamax, fixedeta = fixedeta, maxit = 10, lmaxit = 20,
        Pvec = Pvec2d)
nl_stats!(plot_hist, poutgl, "GMRES(2)"; method=:nkj)
#
printlabel ? (caption = "Fig $fignum in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption; method=:nkj)
return (poutg = poutg, poutgl = poutgl, poutb = poutb)
end
