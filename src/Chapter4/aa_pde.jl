"""
aa_pde(n=31; printlabel=true)
Compare AA to Newton-Krylov for the left preconditioned nonlinear 
convection-diffusion equation.
"""
function aa_pde(n=31; printlabel=true)
fpsize=fsize(printlabel)
#
# Organize the precomputed data and the storage.
#
pdata=pdeinit(n);
fdata=pdata.fdata;
fone=ones(n*n);
u0=zeros(n*n);
FV=copy(u0);
JV=zeros(n*n,20);
mmax=10
Vstore=zeros(n*n,3*mmax+3);
#
rtol = 1.e-8;
atol = 1.e-8;
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
#
pout=nsoli(hardleft!, u0, FV, JV; pdata=pdata, 
           rtol=rtol, atol=atol, maxit=20, eta=.1, fixedeta=false);
nl_stats!(plot_hist, pout, "NewtonL"; method=:nk)

pout=nsoli(pdeF!, u0, FV, JV, Jvec2d; pdata=pdata, Pvec=Pvec2d,
           rtol=rtol, atol=atol, maxit=20, eta=.1, fixedeta=false);
nl_stats!(plot_hist, pout, "NewtonR"; method=:nk)
mvec=[2, 4, 10]
for m in mvec
aout = aasol(hardleftFix!, u0, m, Vstore; pdata=pdata, maxit=40, rtol=rtol,
             atol=atol)
nl_stats!(plot_hist, aout, "m = $m"; method=:aa)
end
printlabel ? (caption = "Fig 4.2 in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption; fpsize=fpsize)
end
