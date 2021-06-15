"""
nk_heq_forcing(printlabel=true)
Compare forcing term strategins for H-equation.
"""
function nk_heq_forcing(printlabel=true)
n=128;
u0=ones(n,);
FS=zeros(n,);
FPS=zeros(n,20);
FPJ=zeros(n,n);
c=.9999;
hdata=heqinit(u0,c);
koutfe=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, fixedeta=true,
               rtol=1.e-8, atol=1.e-8);
koutew=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, 
               rtol=1.e-8, atol=1.e-8, fixedeta=false);
koutew9=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.9, 
               rtol=1.e-8, atol=1.e-8, fixedeta=false);
ksolew=koutew.solution;
ksolew9=koutew9.solution;
ksolfe=koutfe.solution;
khistoryew=koutew.history./koutew.history[1]
khistoryew9=koutew9.history./koutew9.history[1]
khistoryfe=koutfe.history./koutfe.history[1]
kfevals=koutfe.stats.ijac
kfevals2=koutew.stats.ijac
kfevals3=koutew9.stats.ijac
lk=length(khistoryfe); ik=0:1:lk-1;
lk2=length(khistoryew); ik2=0:1:lk2-1;
lk3=length(khistoryew9); ik3=0:1:lk3-1;
imax=max(lk, lk2, lk3)
subplot(1,2,1)
semilogy(ik,khistoryfe,"k-",ik2, khistoryew,"k-.",
         ik3,khistoryew9,"k--")
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
axis([0, imax, 1.e-10, 1.0])
legend([L"fixed $\eta = .1$", L"Eisenstat-Walker: $\eta_{max} = .1$",
        L"Eisenstat-Walker: $\eta_{max}=.9$"])
xlabel("iterations")
ylabel("relative residual")
~printlabel || title("Fig 3.1 from print book")
subplot(1,2,2)
ckfev=cumsum(kfevals)
ckfev2=cumsum(kfevals2)
ckfev3=cumsum(kfevals3)
semilogy(ckfev,khistoryfe,"k-",ckfev2, khistoryew,"k-.",
         ckfev3,khistoryew9,"k--")
lmax=max(maximum(ckfev),maximum(ckfev2),maximum(ckfev3))
axis([0, lmax, 1.e-10, 1.0])
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
xticks(0:3:lmax)
xlabel("Jacobian-vector products")
#return (koutfe=koutfe, koutew=koutew, koutew9=koutew9)
end
