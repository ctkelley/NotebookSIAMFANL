function plothist(args...; semilogflag=true)
   fmtplot=("k-","k--","k-.","k-.","k>:")
   na=length(args)
if na > 10
   error("Too many lines for the graph. Use fewer.")
end
   nplot=na/2
   labelarray=()
   figure(1)
   for iq=1:nplot
   ip=2*iq-1
   labelarray=(labelarray, args[ip+1])
   itmax=length(args[ip].history)
   itc=0:itmax-1
   if semilogflag 
      semilogy(itc,args[ip].history,fmtplot[ip])
   else
      loglog(itc,args[ip].history,fmtplot[ip])
   end
end
legend(labelarray)
ylabel("Nonlinear Residual Norm")
xlabel("Nonlinear Iterations")
end
