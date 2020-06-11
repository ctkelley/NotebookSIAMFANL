"""
atan_test()

This is the Julia code for Figures 1.1 and 1.4 of the 
Green book. 

I documented the solver in nsolsc.jl. The challenge here
is to get the plots to do what I want. I do not recommend your
studying this code.

The call to the solver is pretty simple

local_hist = nsolsc(1.0, atan; fp = fpatan, rtol = 1.e-8, maxit = 20)

and fpatan(x) = 1.0/(1.0+x^2)

is in this .jl file. 

"""
function atan_test()

    #
    # Figure 1.1 on page 3 of the Green book.
    #

    local_hist = nsolsc(atan,1.0; fp = fpatan, rtol = 1.e-8, maxit = 20)
    iplot = true
    if iplot
        figure(1)
        xval = local_hist.solhist
        yval=atan.(xval)
        xtval = -1.2:.01:1.2
        ytval = atan.(xtval)
        ztval = zeros(size(xtval))
        plot(xval, yval, "ko", xtval, ytval, "k-", xtval, ztval, "k-")
        t = 0:.1:1
        xv = xval[1] * (1.0 .- t) + t .* xval[2]
        yv = yval[1] * (1.0 .- t)
        plot(xv, yv, "k-")
        yv = yval[2] * t
        xv = xval[2] .* ones(length(t), 1)
        plot(xv, yv, "k-")
        xv = xval[2] * (1.0 .- t) + t .* xval[3]
        yv = yval[2] * (1.0 .- t)
        plot(xv, yv, "k-")
        yv = yval[3] * t
        xv = xval[3] .* ones(length(t), 1)
        plot(xv, yv, "k-")
        plt.text(1, 0.64, L"(x_0,y_0)")
        plt.text(-.2, .45, L"y=m_0(x)")
        plt.text(xval[2] - .1, .125, L"(x_1,0)")
        plt.text(xval[2] + .05, yval[2] - .1, L"(x_1,y_1)")
        plt.text(xval[3] + .1, -.1, L"(x_2,0)")
        plt.text(xval[3] + .1, yval[3], L"(x_2,y_2)")
        plt.text(-.1, -.25, L"y=m_1(x)")
        plt.text(-.07, .05, L"x^*")
        plot(xval[2], 0, "ko")
        plot(xval[3], 0, "ko")
        ylabel("atan(x)")
        xlabel("x")
# title("Figure 1.1 from Green Book")
#
        # Now for figure 1.4. 
        #
        global_hist = nsolsc(
            atan,
            10.0;
            fp = fpatan, rtol = 1.e-8, atol = 1.e-10, maxit = 20
        )
        rval = global_hist.history
        itc=length(rval)
        ival = 0:itc-1
        figure(2)
        semilogy(ival, abs.(rval), "k-")
        plt.text(ival[2], abs(rval[2] * 5), "3")
        plot(ival[2], abs(rval[2]), "ko")
        plt.text(ival[3], abs(rval[3] * 5), "3")
        plot(ival[3], abs(rval[3]), "ko")
        plt.text(ival[4], abs(rval[4] * 5), "2")
        plot(ival[4], abs(rval[4]), "ko")
        plt.text(ival[5], abs(rval[5] * 5), "2")
        plot(ival[5], abs(rval[5]), "ko")
        ylim(1.e-11, 1000)
        xlim(0, 12)
        ylabel("Absolute Nonlinear Residual")
        xlabel("Nonlinear iterations")
#        title("Figure 1.4 from Green Book")

        return (ithistl = local_hist, ithistg = global_hist)
    end

end
