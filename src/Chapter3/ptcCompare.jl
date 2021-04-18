"""
ptcCompare(printlabel=true)

Creates Figure 3.4 in Chapter 3

"""
function ptcCompare(printlabel=true)
n=63;
maxit=100;
pdt0=1.e-2;
ithist=zeros(25,3)
#
# PTC with direct solvers
#
(ptcout, qout)=ptcBeam(n, maxit);
ithist[:,1]=ptcout.history./ptcout.history[1]
#
# preconditioner with dt
#
hist2=ptciBeam(n, pdt0).history
ithist[:,2]=hist2./hist2[1]
#
# preconditioner without dt
#
hist3=ptciBeam(n, pdt0, false, "right").history 
ithist[:,3]=hist3./hist3[1]
pstr=["k-","k--","k-."]
for ip=1:3
     semilogy(0:24, ithist[:,ip], pstr[ip])
end
xlabel("iterations")
ylabel("relative residual")
legend(["Direct solve","Precond-dt","Precond-no-dt"])
~printlabel || title("Figure 3.4 from the print book")
end

