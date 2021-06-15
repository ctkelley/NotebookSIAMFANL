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
    # Use GMRES, GMRES(2), and BiCGSTAB
    #
    koutb = nsoli(
        heqf!,
        u0,
        FS,
        FV;
        pdata = hdata,
        rtol = rtol,
        atol = atol,
        lmaxit = 40,
        eta = etamax,
        lsolver = "bicgstab",
        fixedeta = fixedeta,
    )
    koutg = nsoli(
        heqf!,
        u0,
        FS,
        FPS;
        pdata = hdata,
        rtol = rtol,
        atol = atol,
        lmaxit = 40,
        eta = etamax,
        fixedeta = fixedeta,
    )
    koutgs = nsoli(
        heqf!,
        u0,
        FS,
        FPSS;
        pdata = hdata,
        rtol = rtol,
        atol = atol,
        lmaxit = 40,
        eta = etamax,
        fixedeta = fixedeta,
    )
    #
    # Get the iteration statistics and organize the plots.
    #
    histg = koutg.history ./ koutg.history[1]
    histgs = koutgs.history ./ koutgs.history[1]
    histb = koutb.history ./ koutb.history[1]
    lng = length(histg)
    xg = 0:lng-1
    lngs = length(histgs)
    xgs = 0:lngs-1
    lnb = length(histb)
    xb = 0:lnb-1
    subplot(1, 2, 1)
    semilogy(xg, histg, "k-", xb, histb, "k--", xgs, histgs, "k-.")
    ylabel("relative residual")
    xlabel("iterations")
    axis([0.0, 6.0, 1.e-13, 1.0])
    ta = collect(1:6)
    xticks(ta)
    subplot(1, 2, 2)
    fvalsg = koutg.stats.ijac
    hplotg = cumsum(fvalsg)
    fvalsgs = koutgs.stats.ijac
    hplotgs = cumsum(fvalsgs)
    fvalsb =  koutb.stats.ijac
    hplotb = cumsum(fvalsb)
    semilogy(hplotg, histg, "k-", hplotb, histb, "k--", hplotgs, histgs, "k-.")
    ~printlabel || title("Fig 3.6 from print book")
    legend(["Gmres", "BiCGSTAB", "GMRES(2)"])
    axis([0, 18.0, 1.e-13, 1.0])
    ta = collect(0:2:18)
    xticks(ta)
    xlabel("Jacobian-vector products")
    return (koutb = koutb, koutg = koutg)
end
