function plothist(args...; semilogflag=true)
   fmtplot=("k-","k--","k-.","k-.","k>:")
   na=length(args)
if na > 10
   error("Too many lines for the graph. Use fewer.")
end
   nplot=Int(na/2)
   labelarray=Array{String,1}(undef,nplot)
   figure(1)
   for iq=1:nplot
   ip=2*iq-1
   labelarray[iq]=args[ip+1]
   itmax=length(args[ip].history)
   itc=0:itmax-1
   if semilogflag 
      semilogy(itc,args[ip].history,fmtplot[iq])
   else
      loglog(itc,args[ip].history,fmtplot[iq])
   end
end
legend(labelarray)
ylabel("Nonlinear Residual Norm")
xlabel("Nonlinear Iterations")
end
