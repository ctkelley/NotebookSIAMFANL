"""
fig2dot4()
Solve the time-dependent buckling beam problem
Draw Figure 2.4
"""
function fig2dot4()
n=40
dt=.01
stepnum=200
(t, se, xe, fhist, fhistt) = ivpBeam(n,dt,stepnum)
plothist_beam_ivp(t,xe,se)
end

function plothist_beam_ivp(t, xe, se)
    mesh(t, xe, se, color = "black")
    xlabel("t")
    xticks(collect(0:0.4:2.0))
    zticks(collect(0:0.4:2.0))
    yticks(collect(0:0.2:1.0))
    ylabel("x")
    zlabel("u(x,t)")
end
