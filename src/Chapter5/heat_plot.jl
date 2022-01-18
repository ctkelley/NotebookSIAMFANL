function heat_plot(p=2, printcap=true)
nx=(10^p)+1; dout=10^(p-1); na=40;
thetal=1.0; thetar=0.0; omega=.9; tau=1.0; Nc=.05;
hn_data=heat_init(nx, na, thetal, thetar, omega, tau, Nc);
theta0=hn_data.bcfix; mmax=10;
Vstore=zeros(nx,3*mmax+3);
tol=1.e-10;
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
#ithist=vec.([]); itdata=vec.([]); fdata=Vector{Int}.([]); 
#legendstr=string.([]);
#
# Anderson acceleration test
#
for m in [0,2]
aout=aasol(heat_fixed!,theta0,m,Vstore; 
          rtol=tol, atol=tol, pdata=hn_data)
m == 0 && (thetabase=aout.solution)
nl_stats!(plot_hist, aout, "AA($m)"; method=:aa)
end
FS=copy(theta0)
#
# Newton-GMRES
#
gout=nsoli(FCR_heat!, theta0, FS, Vstore; pdata=hn_data, rtol=tol, 
           atol=tol, dx=1.e-5, eta=.1, fixedeta=false, lsolver="gmres")
nl_stats!(plot_hist, gout, "Newton-GMRES"; method=:nk)
#
# Newton-BiCGSTAB
#
bout=nsoli(FCR_heat!, theta0, FS, Vstore; pdata=hn_data, rtol=tol, 
           atol=tol, dx=1.e-5, eta=.1, fixedeta=false, lsolver="bicgstab")
nl_stats!(plot_hist, bout, "Newton-BiCGSTAB"; method=:nk)
#
# Plot the results
#
printcap ? (caption = "Fig 5.1 in print book") : (caption = nothing)
plot_its_funs(plot_hist, caption)
end
