module NotebookSIAMFANL

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
export ptcCompare
export LptcCompare

export plothist
export printhist

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
include("Chapter3/ptcCompare.jl")
include("Chapter3/LptcCompare.jl")

include("Tools/plothist.jl")
include("Tools/printhist.jl")

end
