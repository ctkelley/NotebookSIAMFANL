"""
ftan_test()

This is the Julia code for the atan(x) = x example.

See the notebook.

This is another nsolsc example.

"""
function ftan_test()
    nnout=nsolsc(4.5,ftanx; maxit=5, rtol=1.e-17, atol=1.e-17)
 semilogy(nnout.history[:,1], abs.(nnout.history[:,2]),"k-")
   legend(("Newton"))
return nnout
end

function ftanx(x)
   return tan(x) - x
end

function ftanxp(x)
   return -sec(x)^2 - 1
end
