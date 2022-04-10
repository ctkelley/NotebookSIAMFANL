"""
threewaystagnation()

This is the Julia code for the tan(x) = x example.

This code makes Figure 1.3 in the print book.

See the notebook.

"""
function threewaystagnation(printlabel=true)
    fpsize=fsize(printlabel)
    kwnewt=(maxit=14, rtol=1.e-17, atol=1.e-17, printerr=false,  
            stagnationok=true)
    kwchord=(maxit=14, rtol=1.e-17, atol=1.e-17, printerr=false,  
            stagnationok=true,solver="chord")
    kwsec=(maxit=6, rtol=1.e-17, atol=1.e-17, printerr=false,  
            stagnationok=true)
    nnout=nsolsc(x -> tan(x) - x, 4.5; kwnewt...)
    lnn=length(nnout.history)
    nncounter=0:lnn-1
    chout=nsolsc(x -> tan(x) - x, 4.5; kwchord...)
    lnc=length(chout.history)
    nccounter=0:lnc-1
    scout=secant(x -> tan(x) - x, 4.5; kwsec...)
    lns=length(scout.history)
    sccounter=0:lns-1
semilogy(nncounter, nnout.history,"k-",
nccounter, chout.history,"k--",
sccounter, scout.history,"k-."
)
ylabel("Log Absolute Nonlinear Residual",fontsize=fpsize)
xlabel("Nonlinear Iterations",fontsize=fpsize)
legend(("Newton","Chord","Secant"),fontsize=fpsize)
~printlabel || title("Figure 1.3 from print book")
end
