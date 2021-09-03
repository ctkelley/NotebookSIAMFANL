"""
aa_pde(n=31; printlabel=true)
Compare AA to Newton-Krylov for the left preconditioned nonlinear 
convection-diffusion equation.
"""
function aa_pde(n=31; printlabel=true)
#
# Organize the precomputed data and the storage.
#
pdata=pdeinit(n);
fdata=pdata.fdata;
fone=ones(n*n);
u0p=Pfish2d(fone,fdata);
u0=zeros(n*n);
FV=copy(u0);
JV=zeros(n*n,10);
mmax=10
Vstore=zeros(n*n,2(mmax+1));
#
rtol = 1.e-8;
atol = 1.e-8;
mvec=[2, 4, 10]
pstr=["k--.","k-.","k-","k--","k-o"]
lhist=zeros(Int64,5);
ithist=zeros(50,5);
fhist=zeros(Int64,50,2);
#
pout=nsoli(hardleft!, u0, FV, JV; pdata=pdata, 
           rtol=rtol, atol=atol, maxit=20, eta=.1, fixedeta=false);
(hfunl,lhistl,reshistl)=getcost(pout);
lhist[1]=lhistl;
fhist[1:lhistl,1]=hfunl;
ithist[1:lhistl,1]=reshistl;

pout=nsoli(pdeF!, u0, FV, JV, Jvec2d; pdata=pdata, Pvec=Pvec2d,
           rtol=rtol, atol=atol, maxit=20, eta=.1, fixedeta=false);
(hfunl,lhistl,reshistl)=getcost(pout);
lhist[2]=lhistl;
fhist[1:lhistl,2]=hfunl;
ithist[1:lhistl,2]=reshistl;

for ip=1:3
m=mvec[ip]
aout = aasol(hardleftFix!, u0, m, Vstore; pdata=pdata, maxit=40, rtol=rtol,
             atol=atol)
ila=length(aout.history)
lhist[ip+2]=ila;
ithist[1:ila,ip+2]=aout.history./aout.history[1]
end

subplot(1,2,1)
for ip=1:5
semilogy(0:lhist[ip]-1, ithist[1:lhist[ip],ip],pstr[ip])
end
legend(["NewtonL", "NewtonR", "m=2", "m=4", "m=10"])
printlabel && title("Figure 4.2 in print book")
xlabel("Iterations")
ylabel("Relative residual")
subplot(1,2,2)
for ip=1:2
#println(fhist[1:lhist[ip],ip])
semilogy(fhist[1:lhist[ip],ip], ithist[1:lhist[ip],ip],pstr[ip])
end
for ip=3:5
semilogy(1:lhist[ip], ithist[1:lhist[ip],ip],pstr[ip])
end
xlabel("Function Evaluations")

end


function xhardleft!(FV, u, pdata)
fdata=pdata.fdata
FV = pdeF!(FV,u,pdata)
FV .= Pfish2d(FV,fdata)
return FV
end

"""
hardleftFix!(FV, u, pdata)
Fixed point form of the left preconditioned nonlinear 
convection-diffusion equation
"""
function hardleftFix!(FV, u, pdata)
FV = hardleft!(FV, u, pdata)
# G(u) = u - FV
axpby!(1.0, u, -1.0, FV)
return FV
end

function getcost(nout)
lhist=length(nout.history)
tfun=nout.stats.ifun + nout.stats.ijac
hfun=cumsum(tfun)
reshist=nout.history./nout.history[1]
return (hfun, lhist, reshist)
end
