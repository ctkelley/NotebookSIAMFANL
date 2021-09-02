"""
aa_heq(n=128, c=.99; printlabel=true)
Look at how performance of Anderson(m) depends on m for H-equation.
Compare to nsoli.
"""
function aa_heq(n=128, c=.99; printlabel=true)
u0=ones(n,);
hdata=heqinit(u0,c);
FS=zeros(n,);
FPS=zeros(n,20);
mmax=10;
maxit=20;
Vstore=zeros(n,2*(mmax+1));
rtol=1.e-8; 
atol=1.e-8;
ithist=zeros(50,10)
lhist=zeros(Int64,10,)
koutfe=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, fixedeta=true,
               rtol=rtol, atol=atol);
iln=length(koutfe.history);
relresn=koutfe.history./koutfe.history[1]
println(koutfe.stats.ifun+koutfe.stats.ijac)
tfun=cumsum(koutfe.stats.ifun+koutfe.stats.ijac)
ithist[1:iln,5]=relresn;
lhist[5]=iln;
for m=0:3
houta=aasol(HeqFix!, u0, m, Vstore;
        maxit=maxit, pdata=hdata, rtol=rtol, atol=atol)
ila=length(houta.history)
lhist[m+1]=ila;
ithist[1:ila,m+1]=houta.history./houta.history[1]
end
pstr=["k.","k-.","k-","k--","k-o"]
subplot(1,2,1)
for ip=1:5
semilogy(0:lhist[ip]-1, ithist[1:lhist[ip],ip],pstr[ip])
end
xticks(collect(0:2:20))
legend(["m=0", "m=1", "m=2", "m=3", "Newton-GMRES"])
printlabel && title("Figure 4.1 in print book")
xlabel("Iterations")
ylabel("Relative residual")
subplot(1,2,2)
for ip=1:4
semilogy(1:lhist[ip], ithist[1:lhist[ip],ip],pstr[ip])
end
semilogy(tfun,relresn,pstr[5])
xticks(collect(1:2:21))
xlabel("Function Evaluations")
end
