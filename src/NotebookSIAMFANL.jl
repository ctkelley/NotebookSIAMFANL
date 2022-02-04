module NotebookSIAMFANL

struct Data_4_Plots
relreshist::Vector{Float64}
itdata::Vector{Int}
fdata::Vector{Int}
legend::String
end

using PyPlot
using LaTeXStrings
using Printf
using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples

export atan_test
export ftan_test
export ptc_scalar_example
export stagnationtable
export linearmodel
export newtonstagnation
export threewaystagnation
export threewaystagnationv2
export atanarmijo 
export atanarmijov2
export simpleptc
export ptcvarydt
export TwoDexample
export HeqSolutions
export BVPsolution
export beamtimedep
export beamptc
export MyFunction
export PitchFork1
export pdech2
export nk_heq_forcing
export nk_pde_forcing
export nk_pde_side
export nk_heq_bicgstab
export nk_pde_bicgstab
export nk_nopc_pde_bicgstab
export ptcCompare
export LptcCompare
export aa_heq
export aa_pde
export mixing_pde
export heat_plot

export plothist
export printhist
export plot_its_funs
export vary_xferheat_parms

include("Chapter1/linearmodel.jl")
include("Chapter1/newtonstagnation.jl")
include("Chapter1/threewaystagnation.jl")
include("Chapter1/threewaystagnationv2.jl")
include("Chapter1/atanarmijo.jl")
include("Chapter1/atanarmijov2.jl")
include("Chapter1/simpleptc.jl")
include("Chapter1/ptcvarydt.jl")
include("Chapter1/stagnationtable.jl")
include("Chapter1/MyFunction.jl")
include("Chapter1/PitchFork1.jl")
include("Chapter2/TwoDexample.jl")
include("Chapter2/HeqSolutions.jl")
include("Chapter2/BVPsolution.jl")
include("Chapter2/beamtimedep.jl")
include("Chapter2/beamptc.jl")
include("Chapter2/pdech2.jl")
include("Chapter3/nk_heq_forcing.jl")
include("Chapter3/nk_pde_forcing.jl")
include("Chapter3/nk_pde_side.jl")
include("Chapter3/nk_pde_bicgstab.jl")
include("Chapter3/nk_nopc_pde_bicgstab.jl")
include("Chapter3/nk_heq_bicgstab.jl")
include("Chapter3/ptcCompare.jl")
include("Chapter3/LptcCompare.jl")
include("Chapter4/aa_heq.jl")
include("Chapter4/aa_pde.jl")
include("Chapter4/mixing_pde.jl")
include("Chapter5/xferheat.jl")

include("Tools/plothist.jl")
include("Tools/printhist.jl")
include("Tools/plot_its_funs.jl")

end
