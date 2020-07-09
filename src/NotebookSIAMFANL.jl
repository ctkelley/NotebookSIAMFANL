module NotebookSIAMFANL

using PyPlot
using LaTeXStrings
using Printf
using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems

export atan_test
export ftan_test
export ptc_scalar_example
export tab1dot1
export fig1dot1
export fig1dot2
export fig1dot3
export fig1dot4
export fig1dot5
export fig1dot6
export fig1dot7
export MyFunction

export plothist

include("Chapter1/fig1dot1.jl")
include("Chapter1/fig1dot2.jl")
include("Chapter1/fig1dot3.jl")
include("Chapter1/fig1dot4.jl")
include("Chapter1/fig1dot5.jl")
include("Chapter1/fig1dot6.jl")
include("Chapter1/fig1dot7.jl")
include("Chapter1/tab1dot1.jl")
include("Chapter1/MyFunction.jl")
include("Tools/plothist.jl")

end # module
