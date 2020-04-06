"""
fcos_test()

This is the Julia code for the cos(x) = x example.

See the notebook.

This is another snewton example.

"""
function fcos_test()
    nnout=snewton(0.0,fcosx)
    snout=snewton(0.0,fcosx;solver="secant")
 semilogy(nnout.history[:,1], abs.(nnout.history[:,2]),"k-",snout.history[:,1],
      abs.(snout.history[:,2]),"k--")
   legend(("Newton","Secant"))
end

function fcosx(x)
   return cos(x) - x
end

function fcosxp(x)
   return -sin(x) - 1
end
