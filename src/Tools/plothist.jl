"""
plothist(avals,labelarray,vax="residual"; 
                 semilogflag=true, ptitle="")

makes the plots in the notebook for SIAMFANL
"""
function plothist(avals, labelarray, vax = "residual"; semilogflag = true, ptitle = "")
    fmtplot = ["k-", "k--", "k-.", "k:"]
    nplot = length(labelarray)
    if nplot > 4
        error("Too many lines for the graph. Use fewer.")
    end
    figure(1)
    for ip = 1:nplot
        itmax = length(avals[ip])
        itc = 0:itmax-1
        if semilogflag
            semilogy(itc, avals[ip], fmtplot[ip])
        else
            loglog(itc, avals[ip], fmtplot[ip])
        end
    end
    legend(labelarray)
    if ptitle != ""
        title(ptitle)
    end
    if vax == "residual"
        ylabel("Nonlinear Residual Norm")
    else
        ylabel("x")
    end
    xlabel("Nonlinear Iterations")
end
