"""
nk_pde_forcing(printlabel=true, n=31, pside="right")

Solve the Elliptic PDE using nsol.jl on an n x n grid. 

Compare no preconditioning with right preconditioning and EW vs fixed eta.

The mission of these plots is mostly to show how the forcing 
term affects convergence. 
"""
function nk_pde_forcing(printlabel=true, n=31, pside="right")
# Get some room for the residual
rtol=1.e-7; atol=1.e-7;
u0=zeros(n*n,); FV=copy(u0);
# Get the precomputed data from pdeinit
pdata=pdeinit(n);
# Storage for the Jacobian-vector products
JV=zeros(n*n,100);
# Call the solver
# No preconditioner; EW with etamax=.1
houtnp=nsoli(pdeF!, u0, FV, JV; rtol=rtol, atol=atol, eta=.1,
          pdata=pdata, fixedeta=true, maxit=20);
houtew=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.5, pdata=pdata, fixedeta=false, maxit=20, pside=pside);
houtfe=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          pdata=pdata, fixedeta=true, maxit=20, pside=pside);
#
# Plotting and bookkeeping you don't want to look at.
#
subplot(1,2,1)
~printlabel || title("Fig 3.2 from print book")
lnp=length(houtnp.history);
lew=length(houtew.history);
lfe=length(houtfe.history);
hisnp=houtnp.history./houtnp.history[1]
hisew=houtew.history./houtew.history[1]
hisfe=houtfe.history./houtfe.history[1]
semilogy(0:lnp-1,hisnp,"k-",0:lew-1,hisew,"k--",
         0:lfe-1,hisfe,"k-.")
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
xlabel("iterations")
ylabel("relative residual")
legend([L"no preconditioning; fixed $\eta = .1$",
L"Eisenstat-Walker: $\eta_{max}=.5$",
                             L"Fixed $\eta=.1$"])
subplot(1,2,2)
foutnp=cumsum(houtnp.stats.ijac)
foutew=cumsum(houtew.stats.ijac)
foutfe=cumsum(houtfe.stats.ijac)
semilogy(foutnp,hisnp,"k-",foutew,hisew,"k--",
         foutfe,hisfe,"k-.")
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
xlabel("Jacobian-vector products")
#return (houtnp=houtnp, houtew=houtew, houtfe=houtfe)
end
