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

include("ScalarEquations/atan_test.jl")
include("ScalarEquations/ftan_test.jl")
include("ScalarEquations/ptc_scalar_example.jl")

end # module
