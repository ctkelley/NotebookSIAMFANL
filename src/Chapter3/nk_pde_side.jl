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
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
fignum="3.3"
# Call the solver
# EW with etamax=.9
legend(["Right", "Left", "Left-NL"])
houtrs=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.9, pdata=pdata, fixedeta=false, maxit=20, pside="right");
nl_stats!(plot_hist, houtrs, "Right"; method=:nkj)
houtls=nsoli(pdeF!, u0, FV, JV, Jvec2d; rtol=rtol, atol=atol, Pvec=Pvec2d,
          eta=.9, pdata=pdata, fixedeta=false, maxit=200, pside="left");
nl_stats!(plot_hist, houtls, "Left"; method=:nkj)
houtlnl=nsoli(hardleft!, u0, FV, JV; rtol=rtol, atol=atol,
          eta=.9, pdata=pdata, fixedeta=false, maxit=200);
nl_stats!(plot_hist, houtlnl, "Left-NL"; method=:nkj)
#
printlabel ? (caption = "Fig $fignum in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption; method=:nkj)
return (houtrs=houtrs, houtls=houtls, houtlnl=houtlnl)
end
