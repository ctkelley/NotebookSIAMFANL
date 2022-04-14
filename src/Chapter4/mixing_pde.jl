"""
mixing_pde(n=31; printlabel=false)
So6lve the left preconditioned convection-diffusion problem with
a mixing parameter beta=.2
"""
function mixing_pde(n=31; printlabel=false)
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
#
# Set up the data for the plots. Look at NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
#
# AA for a few depths with a little mixing
#
for m in mvec
aout = aasol(hardleftFix!, u0, m, Vstore; pdata=pdata, maxit=100, rtol=rtol,
             atol=atol,beta=.2)
nl_stats!(plot_hist, aout, "m = $m"; method=:aa)
end
printlabel ? (caption = "Fig 4.X in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption)
title("Figure 4.3 in print book")
end
