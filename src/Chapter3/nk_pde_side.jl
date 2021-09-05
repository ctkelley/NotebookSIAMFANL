"""
nk_pde_side(printlabel=true, n=31)

Solve the Elliptic PDE using nsol.jl on an n x n grid. 

Compare left and right preconditioning with tight and lose forcing and
nonlinear left preconditioning with lose forcing.

"""
function nk_pde_side(printlabel=true, n=31)
#function hard_left(printlabel=true, n=31)
# Get some room for the residual
rtol=1.e-7; atol=1.e-7;
u0=zeros(n*n,); FV=copy(u0);
# Get the precomputed data from pdeinit
pdata=pdeinit(n);
# Storage for the Jacobian-vector products
JV=zeros(n*n,100);
# Call the solver
# EW with etamax=.9
houtrs=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.9, pdata=pdata, fixedeta=false, maxit=20, pside="right");
houtls=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.9, pdata=pdata, fixedeta=false, maxit=200, pside="left");
houtlnl=nsoli(hardleft!, u0, FV, JV; rtol=rtol, atol=atol,
          eta=.9, pdata=pdata, fixedeta=false, maxit=200);
#
# Plotting and bookkeeping you don't want to look at.
#
subplot(1,2,1)
~printlabel || title("Fig 3.3 from print book")
lrs=length(houtrs.history);
lls=length(houtls.history);
llnls=length(houtlnl.history);
hisrs=houtrs.history./houtrs.history[1]
hisls=houtls.history./houtls.history[1]
hislnl=houtlnl.history./houtlnl.history[1]
semilogy(0:lrs-1,hisrs,"k-",0:lls-1,hisls,"k--",
         0:llnls-1,hislnl,"k-.")
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
xlabel("iterations")
ylabel("relative residual")
legend(["Right", "Left", "Left-NL"])
subplot(1,2,2)
foutrs=cumsum(houtrs.stats.ijac)
foutls=cumsum(houtls.stats.ijac)
foutlnls=cumsum(houtlnl.stats.ijac)
semilogy(foutrs,hisrs,"k-",foutls,hisls,"k--",
          foutlnls,hislnl,"k-.")
yticks([1.0, 1.e-2, 1.e-4, 1.e-6, 1.e-8])
xlabel("Jacobian-vector products")
return (houtrs=houtrs, houtls=houtls, houtlnl=houtlnl)
end
