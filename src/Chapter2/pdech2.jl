function pdech2(printlabel=true)
n=31; 
hout=NsolPDE(n; rtol=1.e-10, atol=1.e-12)
rhist=hout.history/hout.history[1]
hp=length(rhist)
its=collect(0:hp-1)
houts=NsolPDE(n; sham=5, rtol=1.e-10, atol=1.e-12)
rhists=houts.history/houts.history[1]
hps=length(rhists)
itss=collect(0:hps-1)
semilogy(its,rhist,"k-", itss,rhists,"k--")
legend(["Newton", "Shamanksii, m=5"])
xlabel("iterations")
ylabel("relative residual")
~printlabel || title("Fig 2.6 from print book")
end
