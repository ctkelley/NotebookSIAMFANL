"""
ftan_test()

This is the Julia code for the tan(x) = x example.

This code makes Figures 1.2 and 1.3 in the print book.

See the notebook.

"""
function ftan_test()
    nnout=nsolsc(ftanx,4.5; maxit=14, rtol=1.e-17, atol=1.e-17)
    lnn=length(nnout.history)
    nncounter=0:lnn-1
    chout=nsolsc(ftanx,4.5; maxit=14, rtol=1.e-17, atol=1.e-17, solver="chord")
    lnc=length(chout.history)
    nccounter=0:lnc-1
    scout=nsolsc(ftanx,4.5; maxit=6, rtol=1.e-17, atol=1.e-17, solver="secant")
    lns=length(scout.history)
    sccounter=0:lns-1
figure(1)
 semilogy(0:5, nnout.history[1:6],"k-")
ylabel("Log Absolute Nonlinear Residual")
xlabel("Nonlinear Iterations")
plt.text(4.1, 2.e-15,"Stagnation")
figure(2)
semilogy(nncounter, nnout.history,"k-",
nccounter, chout.history,"k--",
sccounter, scout.history,"k-."
)
ylabel("Log Absolute Nonlinear Residual")
xlabel("Nonlinear Iterations")
legend(("Newton","Chord","Secant"))
return nnout
end

#function ftanx(x)
#   return tan(x) - x
#end

#function ftanxp(x)
#   return sec(x)^2 - 1
#end
