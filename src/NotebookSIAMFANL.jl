module NotebookSIAMFANL

using PyPlot
using LaTeXStrings
using Printf
using JLD2
using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems

export atan_test
export ftan_test
export ptc_scalar_example
export fig1dot1
export fig1dot2
export fig1dot3
export fig1dot4

include("Chapter1/ftan_test.jl")
include("Chapter1/ptc_scalar_example.jl")
include("Chapter1/fig1dot1.jl")
include("Chapter1/fig1dot2.jl")
include("Chapter1/fig1dot3.jl")
include("Chapter1/fig1dot4.jl")

end # module
