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
export fig1.1

include("ScalarEquations/atan_test.jl")
include("ScalarEquations/ftan_test.jl")
include("ScalarEquations/ptc_scalar_example.jl")
include("ScalarEquations/fig1.1.jl")

end # module
