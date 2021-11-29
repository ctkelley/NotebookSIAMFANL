"""
mixing_pde(n=31; printlabel=true)
So6lve the left preconditioned convection-diffusion problem with
a mixing parameter beta=.2
"""
function mixing_pde(n=31; printlabel=true)
pdata=pdeinit(n);
fdata=pdata.fdata;
fone=ones(n*n);
u0=zeros(n*n);
FV=copy(u0);
JV=zeros(n*n,10);
mmax=10
Vstore=zeros(n*n,3*mmax+3);
#
rtol = 1.e-8;
atol = 1.e-8;
mvec=[0, 2, 4, 10]
pstr=["k--.","k-.","k-","k--","k-o"]
lhist=zeros(Int64,5);
ithist=zeros(101,5);
fhist=zeros(Int64,101,2);
#
for ip=1:4
m=mvec[ip]
aout = aasol(hardleftFix!, u0, m, Vstore; pdata=pdata, maxit=100, rtol=rtol,
             atol=atol,beta=.2)
ila=length(aout.history)
lhist[ip]=ila;
ithist[1:ila,ip]=aout.history./aout.history[1]
end
subplot(1,2,1)
for ip=1:4
semilogy(0:lhist[ip]-1, ithist[1:lhist[ip],ip],pstr[ip])
end
(m1,m2,m3,m4)=mvec;
legend(["m=$m1", "m=$m2", "m=$m3", "m=$m4"])
printlabel && title("Figure 4.X in print book")
xlabel("Iterations")
ylabel("Relative residual")
subplot(1,2,2)
for ip=1:4
semilogy(1:lhist[ip], ithist[1:lhist[ip],ip],pstr[ip])
end
xlabel("Function Evaluations")

end
