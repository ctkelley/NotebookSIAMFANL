"""
ftan_test()

This is the Julia code for the tan(x) = x example.

This code makes Figures 1.2 and 1.3 in the print book.

See the notebook.

"""
function ftan_test()
    nnout=nsolsc(4.5,ftanx; maxit=14, rtol=1.e-17, atol=1.e-17)
    chout=nsolsc(4.5,ftanx; maxit=14, rtol=1.e-17, atol=1.e-17, sham=Inf)
    scout=nsolsc(4.5,ftanx; maxit=14, rtol=1.e-17, atol=1.e-17, solver="secant")
figure(1)
 semilogy(nnout.history[1:6,1], abs.(nnout.history[1:6,2]),"k-")
ylabel("Log Absolute Nonlinear Residual")
xlabel("Nonlinear Iterations")
plt.text(4.1, 2.e-15,"Stagnation")
figure(2)
semilogy(nnout.history[:,1], abs.(nnout.history[:,2]),"k-",
chout.history[:,1], abs.(chout.history[:,2]),"k--",
scout.history[:,1], abs.(scout.history[:,2]),"k-."
)
ylabel("Log Absolute Nonlinear Residual")
xlabel("Nonlinear Iterations")
legend(("Newton","Chord","Secant"))
return nnout
end

#function ftanx(x)
#   return tan(x) - x
#end

#function ftanxp(x)
#   return sec(x)^2 - 1
#end
