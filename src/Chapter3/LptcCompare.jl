"""
LptcCompare(printlabel=true)

Creates Figure 3.5 in Chapter 3

Left preconditioning this time

"""
function LptcCompare(printlabel=true)
n=63;
dx=1.0/(n+1);
xv=collect(dx:dx:1.0-dx)
maxit=100;
pdt0=1.e-2;
ithist=zeros(26,2)
itl=zeros(Int64,2,)
#
# preconditioner with dt
#
dtout=ptciBeam(n, pdt0, true, "left")
itl[1]=length(dtout.history)
ithist[1:itl[1],1]=dtout.history./dtout.history[1]
#
# preconditioner without dt
#
nodtout=ptciBeam(n, pdt0, false, "left")
itl[2]=length(nodtout.history)
ithist[1:itl[2],2]=nodtout.history./nodtout.history[1]
pstr=["k-","k--"]
subplot(1,2,1)
xlabel("iterations")
ylabel("relative residual")
for ip=1:2
     semilogy(0:itl[ip]-1, ithist[1:itl[ip],ip], pstr[ip])
end
legend(["Precond-dt","Precond-no-dt"])
~printlabel || title("Figure 3.5 from the print book")
subplot(1,2,2)
ylabel("u"); 
xlabel("x")
plot(xv, dtout.solution,"k-",xv, nodtout.solution,"k--")
end

