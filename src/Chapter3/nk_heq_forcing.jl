"""
nk_heq_forcing(printlabel=true)
Compare forcing term strategies for H-equation.
"""
function nk_heq_forcing(printlabel=true)
n=128;
u0=ones(n,);
FS=zeros(n,);
FPS=zeros(n,20);
FPJ=zeros(n,n);
c=.9999;
hdata=heqinit(u0,c);
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
koutfe=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, fixedeta=true,
               rtol=1.e-8, atol=1.e-8);
nl_stats!(plot_hist, koutfe, L"fixed $\eta = .1$"; method=:nkj)
koutew=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.1, 
               rtol=1.e-8, atol=1.e-8, fixedeta=false);
nl_stats!(plot_hist, koutew, L"Eisenstat-Walker: $\eta_{max} = .1$";method=:nkj)
koutew9=nsoli(heqf!, u0, FS, FPS; pdata=hdata, eta=.9, 
               rtol=1.e-8, atol=1.e-8, fixedeta=false);
nl_stats!(plot_hist, koutew9, 
         L"Eisenstat-Walker: $\eta_{max} = .9$";method=:nkj)
printlabel ? (caption = "Fig 3.1 in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption; method=:nkj)
end
