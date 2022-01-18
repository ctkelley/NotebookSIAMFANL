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
Vstore=zeros(n,3*mmax+3);
rtol=1.e-8; 
atol=1.e-8;
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
#
# AA for a few depths
#
for m=0:3
houta=aasol(HeqFix!, u0, m, Vstore;
        maxit=maxit, pdata=hdata, rtol=rtol, atol=atol)
nl_stats!(plot_hist, houta, "m = $m"; method=:aa)
end
#
# vs Newton-GMRES
#
koutfe=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, fixedeta=true,
               rtol=rtol, atol=atol);
nl_stats!(plot_hist, koutfe, "Newton-GMRES"; method=:nk)
printlabel ? (caption = "Fig 4.1 in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption)
end
