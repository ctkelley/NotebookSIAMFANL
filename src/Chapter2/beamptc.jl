function beamptc(printlabel=true)
n=63; maxit=100;
(pout, nout) = ptcBeam(n, maxit)
phist=pout.history/pout.history[1]
nhist=nout.history/nout.history[1]
lp=length(phist)
ipit=collect(0:lp-1)
np=length(nhist)
init=collect(0:np-1)
semilogy(ipit,phist,"k-",init,nhist,"k--")
legend([L"\Psi TC", "Newton"])
xlabel("iterations")
ylabel("relative residual")
~printlabel || title("Fig 2.7 from print book")
end
