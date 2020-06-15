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

include("Chapter1/fig1dot1.jl")
include("Chapter1/fig1dot2.jl")
include("Chapter1/fig1dot3.jl")
include("Chapter1/fig1dot4.jl")
include("Chapter1/fig1dot5.jl")
include("Chapter1/tab1dot1.jl")
include("Chapter1/ptc_scalar_example.jl")

end # module
