"""
nk_pde_forcing(printlabel=true, n=31, pside="right")

Solve the Elliptic PDE using nsol.jl on an n x n grid. 

Compare no preconditioning with right preconditioning and EW vs fixed eta.

The mission of these plots is mostly to show how the forcing 
term affects convergence. 
"""
function nk_pde_forcing(printlabel=true, n=31, pside="right")
fpsize=fsize(printlabel)
# Get some room for the residual
rtol=1.e-7; atol=1.e-7;
u0=zeros(n*n,); FV=copy(u0);
# Get the precomputed data from pdeinit
pdata=pdeinit(n);
# Storage for the Jacobian-vector products
JV=zeros(n*n,100);
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
fignum="3.2"
#
# Call the solver
#
# No preconditioner; EW with etamax=.1
houtnp=nsoli(pdeF!, u0, FV, JV; rtol=rtol, atol=atol, eta=.1,
          pdata=pdata, fixedeta=true, maxit=20);
nl_stats!(plot_hist, houtnp, L"no preconditioning; fixed $\eta = .1$"; 
           method=:nkj)
houtew=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.5, pdata=pdata, fixedeta=false, maxit=20, pside=pside);
nl_stats!(plot_hist, houtew, L"Eisenstat-Walker: $\eta_{max}=.5$"; 
           method=:nkj)
houtfe=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          pdata=pdata, fixedeta=true, maxit=20, pside=pside);
nl_stats!(plot_hist, houtfe, L"Fixed $\eta=.1$",
           method=:nkj)
printlabel ? (caption = "Fig $fignum in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption; method=:nkj, fpsize=fpsize)
end
