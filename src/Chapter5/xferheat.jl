function vary_xferheat_parms(fnote=1)

figmult=fnote
figure(1)
xferheat(;fignum=figmult);
figure(2)
xferheat(2, 1.0, 1.8, .5, 2.0, [2, 5, 10]; fignum=2*figmult);
figure(3)
xferheat(2, 1.0, 2.0, .5, 4.0, [5, 10, 20]; fignum=3*figmult);
end
"""
function xferheat(p=2, thetal=1.0, thetar=0.0, omega=.9, tau=1.0,
                  mvec=[0, 2, 5]; fignum=0)


Test results and performance for the conductive-radiative heat
transfer problems. 

author="C. E. Siewert and J. R. Thomas",
title="A Computational Method for Solving a Class of Coupled
Conductive-Radiative Heat Transfer Problems",
journal="J. Quant. Spectrosc. Radiat. Transfer",
year=1991,
volume=45,
pages="273--281"

Compares Newton-GMRES agains AA(m) for various m for instances of
the conductive-radiative heat transfer problem. In the book we
pick one easy problem from the Thomas-Siewert paper and two harder
problems that show what happens to AA when contractivity goes south.

Those problems are

Easy: thetar=0.0, omega=.9, tau=1.0 (Fig 5.1)
Harder: thetar=1.8, omega=.5, tau=2.0 (Fig 5.2)
Easy: thetar=2.0, omega=.5, tau=4.0 (Fig 5.3)

In all cases thetal=0.0.
"""
function xferheat(p=2, thetal=1.0, thetar=0.0, omega=.9, tau=1.0,
                  mvec=[0, 2, 5]; fignum=0)
#
# Try this xferheat(3, 1.0, 1.8, .5, 2.0, mvec=[2, 5, 10])
# xferheat(3, 1.0, 1.8, .5, 4.0, mvec= [2, 10, 20])
#
nx=(10^p)+1; dout=10^(p-1); na=40;
#thetal=1.0; thetar=0.0; omega=.9; tau=1.0; 
Nc=.05;
hn_data=heat_init(nx, na, thetal, thetar, omega, tau, Nc);
theta0=hn_data.bcfix; mmax=30;
Vstore=zeros(nx,3*mmax+3);
tol=1.e-10;
#
# Set up the data for the plots. Look NotebookSIAMFANL.jl for the
# definition of the Data_4_Plots structure.
#
plot_hist = Vector{Data_4_Plots}()
#
# Anderson acceleration test
#
thetabase=zeros(nx)
FS=copy(theta0)
for m in mvec
aout=aasol(heat_fixed!,theta0,m,Vstore; 
          rtol=tol, atol=tol, pdata=hn_data, maxit=50);
(m == 2) && (thetabase.=aout.solution)
(aout.errcode == 0) || println("thetar = $thetar, tau=$tau, omega=$omega")
nl_stats!(plot_hist, aout, "AA($m)"; method=:aa)
end
#
# Newton-GMRES
#
gout=nsoli(FCR_heat!, theta0, FS, Vstore; pdata=hn_data, rtol=tol, 
           atol=tol, dx=1.e-5, eta=.1, fixedeta=false, lsolver="gmres")
nl_stats!(plot_hist, gout, "Newton-GMRES"; method=:nk)
#
# Newton-BiCGSTAB
#
#bout=nsoli(FCR_heat!, theta0, FS, Vstore; pdata=hn_data, rtol=tol, 
#           atol=tol, dx=1.e-5, eta=.1, fixedeta=false, lsolver="bicgstab")
#nl_stats!(plot_hist, bout, "Newton-BiCGSTAB"; method=:nk)
#
# Plot the results
#
varcap=parm_string(tau, omega, thetar)
if fignum > 0
caption = string("Fig 5.$fignum: ", varcap)
else
caption = varcap
end
plot_its_funs(plot_hist, caption; method=:nk)
end

function parm_string(tau, omega, thetar)
tauv = @sprintf("%4.1f", tau)
omegav = @sprintf("%4.1f", omega)
thetarv= @sprintf("%4.1f", thetar)
varcap = latexstring("\$\\tau = \$",tauv,"; \$\\omega = \$", omegav,
                     "; \$\\theta_r= \$",thetarv)
end
