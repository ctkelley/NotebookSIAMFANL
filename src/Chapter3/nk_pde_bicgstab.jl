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
    # Call the solver with a finite-difference Jac-Vec, FFT preconditioner
    # with GMRES, GMRES(2), and BiCGSTAB as the linear solvers
    #
    poutg = nsoli(
        pdeF!,
        u0,
        FV,
        JVL;
        rtol = rtol,
        atol = atol,
        pdata = pdata,
        eta = etamax,
        fixedeta = fixedeta,
        maxit = 10,
        lmaxit = 20,
        Pvec = Pvec2d,
    )
    poutgl = nsoli(
        pdeF!,
        u0,
        FV,
        JV;
        rtol = rtol,
        atol = atol,
        pdata = pdata,
        eta = etamax,
        fixedeta = fixedeta,
        maxit = 10,
        lmaxit = 20,
        Pvec = Pvec2d,
    )
    poutb = nsoli(
        pdeF!,
        u0,
        FV,
        FVS;
        rtol = rtol,
        atol = atol,
        pdata = pdata,
        eta = etamax,
        fixedeta = fixedeta,
        maxit = 10,
        lmaxit = 20,
        Pvec = Pvec2d,
        lsolver = "bicgstab",
    )
    #
    # Collect the iteration statistics and make the plots
    #
    histgl = poutgl.history ./ poutgl.history[1]
    lgl = length(histgl)
    xgl = 0:lgl-1
    histg = poutg.history ./ poutg.history[1]
    lg = length(histg)
    xg = 0:lg-1
    histb = poutb.history ./ poutb.history[1]
    lb = length(histb)
    xb = 0:lb-1
    subplot(1, 2, 1)
    semilogy(xg, histg, "k-", xb, histb, "k--", xgl, histgl, "k-.")
    ylabel("relative residual")
    axis([0.0, 7.0, 1.e-8, 1.0])
    xlabel("iterations")
    ~printlabel || title("Fig 3.7 from print book")
    subplot(1, 2, 2)
    fvalsg = poutg.stats.ijac
    hplotg = cumsum(fvalsg)
    fvalsb = poutb.stats.ijac
    hplotb = cumsum(fvalsb)
    fvalsgl = poutgl.stats.ijac
    hplotgl = cumsum(fvalsgl)
    semilogy(hplotg, histg, "k-", hplotb, histb, "k--", hplotgl, histgl, "k-.")
    ~printlabel || title("Fig 3.7 from print book")
    axis([0.0, 60.0, 1.e-8, 1.0])
    xlabel("Jacobian-vector products")
    legend(["Gmres", "BiCGSTAB", "GMRES(2)"])
    return (poutg = poutg, poutgl = poutgl, poutb = poutb)
end
