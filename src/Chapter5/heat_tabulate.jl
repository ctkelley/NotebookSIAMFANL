#
# Test results and performance for the conductive-radiative heat
# transfer problems. We agree to all figures reported with tables
# 2 and 3 in 
#
# author="C. E. Siewert and J. R. Thomas",
# title="A Computational Method for Solving a Class of Coupled
# Conductive-Radiative Heat Transfer Problems",
# journal="J. Quant. Spectrosc. Radiat. Transfer",
# year=1991,
# volume=45,
# pages="273--281"
#
function heat_tabulate(PrintTex = false)
P1ok = heat_test_aa(1.0, 0.0)
P2ok = heat_test_aa(1.0, 0.5)
xvals=0.0:.1:1.0;
ces_maketab(xvals, P1ok, P2ok; tex = PrintTex)
return (P1 = P1ok, P2 = P2ok)
end
#
function ces_maketab(xvals, P1ok, P2ok; tex=false)
printf(fmt::String,args...) = @eval @printf($fmt,$(args...))
sprintf(fmt::String,args...) = @eval @sprintf($fmt,$(args...))
lvx=L"$x$"; lt1=L"$\Theta_1$"; lt2=L"$\Theta_2$";
if tex
printf("%s", "\\begin{tabular}{|c|c|c|} \n")
printf("%s & %12s & %15s \\\\ \n", lvx, lt1, lt2)
for i=1:11
printf("%5.2f & %15.5e & %15.5e \\\\ \n", xvals[i], P1ok[i], P2ok[i])
end
printf("\\end{tabular}")
else
lvx=L"$x$"; lt1=L"$\Theta_1$"; lt2=L"$\Theta_2$";
printf("%s %12s %15s \n", lvx, lt1, lt2)
#printf("%s %12s %15s \n", "  x", "T1", "T2")
for i=1:11
printf("%5.2f %15.5e %15.5e \n", xvals[i], P1ok[i], P2ok[i])
end
end
end
#
function heat_test_aa(thetal = 1.0, thetar = 0.0)
    nx = (10^3) + 1
    dout = 10^(3 - 1)
    na = 40
    #    thetal = 1.0
    #    thetar = 0.5
    aa_it_len= [7, 7, 7, 7, 7]
    (thetar == 0.0) || (aa_it_len = [10, 8, 7, 8, 8])
    omega = 0.9
    tau = 1.0
    Nc = 0.05
    hn_data = heat_init(nx, na, thetal, thetar, omega, tau, Nc)
    theta0 = hn_data.bcfix
    mmax = 10
    Vstore = zeros(nx, 3 * mmax + 3)
    tol = 1.e-10
    #
    # Anderson acceleration test
    #
    aout = aasol(
        heat_fixed!,
        theta0,
        0,
        Vstore;
        maxit = 40,
        rtol = tol,
        atol = tol,
        pdata = hn_data,
    )
    thetabase = aout.solution
    test_out = thetabase[1:dout:nx]
    bench_heat = ces_heat(thetar)
    del_heat = norm(test_out - bench_heat, Inf)
    heatokaa = (del_heat < 1.e-4)
    heatokaa || println("Wrong results for xferheat: error = $del_heat")
    m=2
        aout =
            aasol(heat_fixed!, theta0, m, Vstore; rtol = tol, atol = tol, pdata = hn_data)
        delsol = norm(aout.solution - thetabase, Inf)
        lhist = length(aout.history)
        heatmok = (delsol < 1.e-6) && (lhist == aa_it_len[m] )
        heatmok || println("xferheat: aa fails for m=$m and thetar=$thetar")
        heatmok || println("lhist for AA($m) = $lhist")
        heatokaa = heatokaa && heatmok
        #println("m=$m. solution difference = $delsol. Iterations = $lhist")
    chist = aout.stats.condhist
    ahist = aout.stats.alphanorm
    heatokaa || println("aa test for heat fails")
    return test_out
end

function ces_heat(thetar)
    if thetar == 0.0
        bench_heat = [
            1.00000e+00,
            9.18027e-01,
            8.36956e-01,
            7.53557e-01,
            6.65558e-01,
            5.71475e-01,
            4.70505e-01,
            3.62437e-01,
            2.47544e-01,
            1.26449e-01,
            0.00000e+00,
        ]
    else
        bench_heat = [
            1.00000e+00,
            9.54270e-01,
            9.11008e-01,
            8.68433e-01,
            8.25127e-01,
            7.79940e-01,
            7.31936e-01,
            6.80375e-01,
            6.24709e-01,
            5.64610e-01,
            5.00000e-01,
        ]
    end
    return bench_heat
end
