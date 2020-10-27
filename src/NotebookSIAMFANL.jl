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
export fig1dot3b
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

export plothist
export printhist

include("Chapter1/linearmodel.jl")
include("Chapter1/newtonstagnation.jl")
include("Chapter1/threewaystagnation.jl")
include("Chapter1/fig1dot3b.jl")
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

include("Tools/plothist.jl")
include("Tools/printhist.jl")

end
