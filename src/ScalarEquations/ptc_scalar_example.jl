"""
ptc_scalar_example()

Make the ptc plots for the scalar example.

f(u) = u^3 - lambda u = 0 with lambda = 1/2

The answer(s!!) are u=0, -sqrt(2)/2, and sqrt(2)/2.

The initial iterate is u0=.1. You'll see Newton converge to the 
unstable soluution u=0 and ptc do it's job and get u=sqrt(2).

You might want to experiment with different values of dt0. I picked
a big one so that I would not have to spend forever waiting for the
transients to go away. 

"""
function ptc_scalar_example()
u0=.1
ustable=.5*sqrt(2.0)
uunstable=0.0
#
# Convergence to two different solutions.
#
ptcdata1=sptc(u0,sptest; dt0=1.0, rtol=1.e-12)
ptcerr=ptcdata1.history[:,3].-ustable
ptcfun=ptcdata1.history[:,2]
ptcdt=ptcdata1.history[:,4]
pival=ptcdata1.history[:,1]
newtdata=snewton(u0,sptest)
nival=newtdata.history[:,1]
itlim=length(pival)
newterr=newtdata.history[:,3]
#
# Newton errors vs PTC errors
#
figure(1)
subplot(1,2,1)
semilogy(pival,abs.(ptcerr),"k--",nival,abs.(newterr),"k-")
PTClabel=L"$\Psi$TC"
legend((PTClabel,"Newton"))
xlabel("Iterations",fontsize="12")
gylabele=L"$|u-u^*|$"
ylabel(gylabele,fontsize="12")
axis([0, itlim, 1.e-17, 1.0])
#
# Look at how |f| and dt almost mirror each other, as the forumla
# says they should.
#
subplot(1,2,2)
semilogy(pival,abs.(ptcfun),"k-",pival,ptcdt,"k--")
xlabel("Iterations",fontsize="12")
gylabelfdt=L"$|f|$ and $dt$"
gylabelf=L"$|f|$"
gylabeldt=L"$dt$"
ylabel(gylabelfdt,fontsize="12")
legend((gylabelf, gylabeldt))
axis([0, itlim, 1.e-15, 1.e15])
PyPlot.tight_layout()
#bigtitle=L"$\Psi TC$ results"
#PyPlot.suptitle(bigtitle)


ptcdata2=sptc(u0,sptest; dt0=1.e-2,maxit=1000)
return (ptcdata=ptcdata1, newtdata=newtdata)
end
