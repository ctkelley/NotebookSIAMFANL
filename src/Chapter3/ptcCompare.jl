"""
ptcCompare(printlabel=true)

Creates Figure 3.4 in Chapter 3

"""
function ptcCompare(printlabel=true)
fpsize=fsize(printlabel)
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
dtout=ptciBeam(n, pdt0)
fcostdt=cumsum(dtout.stats.ijac)
hist2=dtout.history
#hist2=ptciBeam(n, pdt0).history
ithist[:,2]=hist2./hist2[1]
#
# preconditioner without dt
#
nodtout=ptciBeam(n, pdt0, false, "right")
fcostnodt=cumsum(nodtout.stats.ijac)
hist3=nodtout.history
#hist3=ptciBeam(n, pdt0, false, "right").history 
ithist[:,3]=hist3./hist3[1]
pstr=["k-","k--","k-."]
subplot(1,2,1)
for ip=1:3
     semilogy(0:24, ithist[:,ip], pstr[ip])
end
dts=L"$\delta$"
#legend(["Direct solve","Precond-dt","Precond-no-dt"])
legend(["Direct solve","Precond-$dts","Precond-no-$dts"])
xlabel("iterations",fontsize=fpsize)
ylabel("relative residual",fontsize=fpsize)
~printlabel || title("Figure 3.4 from the print book")
subplot(1,2,2)
semilogy(fcostdt, ithist[:,2], pstr[2],
         fcostnodt, ithist[:,3], pstr[3]) 
xlabel("Jacobian-vector products", fontsize=fpsize)
end

