"""
simpleptc(printlabel=true)

Make Figure 1.6 in the print book.

f(x) = x^3 - lambda x = 0 with lambda = 1/2

The answer(s!!) are x=0, -sqrt(2)/2, and sqrt(2)/2.

The initial iterate is x0=.1. You'll see Newton converge to the 
unstable soluution x=0 and ptc do it's job and get x=sqrt(2).

You might want to experiment with different values of delta0. I picked
a big one so that I would not have to spend forever waiting for the
transients to go away. 

"""
function simpleptc(printlabel=true)
x0=.1
ustable=.5*sqrt(2.0)
uunstable=0.0
#
# Convergence to two different solutions.
#
ptcdata1=ptcsolsc(sptest,x0; delta0=1.0, rtol=1.e-12)
#
# solhist is a matrix with the solutions in the columns. For
# scalar equations I need to take the transpose to get the plots the way
# I want them.
#
ptcerr=ptcdata1.solhist'[:,1]
ptcerr .-= ustable
ptcfun=ptcdata1.history
newtdata=nsolsc(sptest,x0)
lnival=length(newtdata.history)
nival=collect(0:lnival-1)
itlim=length(ptcfun)
pival=collect(0:itlim-1)
newterr=abs.(newtdata.solhist'[:,1])
newtresid=newtdata.history
#
# Newton errors vs PTC errors
#
#printlabel ? fpsize="12" : fpsize = "14"
fpsize=fsize(printlabel)
figure(1)
subplot(1,2,1)
~printlabel || title("Figure 1.6 from print book")
semilogy(pival,abs.(ptcerr),"k--",nival,abs.(newterr),"k-")
PTClabel=L"$\Psi$TC"
legend((PTClabel,"Newton"),fontsize=fpsize)
xlabel("Iterations",fontsize=fpsize)
gylabele=L"$|x-x^*|$"
ylabel(gylabele,fontsize=fpsize)
axis([0, itlim, 1.e-17, 1.0])
#
# Look at how |f| and dt almost mirror each other, as the forumla
# says they should.
#
subplot(1,2,2)
semilogy(pival,abs.(ptcfun),"k--",nival,newtresid,"k-")
xlabel("Iterations",fontsize=fpsize)
gylabelfdt=L"$|f|$"
ylabel(gylabelfdt,fontsize=fpsize)
legend((PTClabel,"Newton"),fontsize=fpsize)
axis([0, itlim, 1.e-15, 1.0])
PyPlot.tight_layout()

return (ptcdata=ptcdata1, newtdata=newtdata)
end
