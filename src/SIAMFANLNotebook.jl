module SIAMFANLNotebook

using PyPlot
using LaTeXStrings
using Printf
using JLD2
using LinearAlgebra
using ScalarEquations

export atan_test
export fcos_test
export ptc_scalar_example

include("ScalarEquations/atan_test.jl")
include("ScalarEquations/fcos_test.jl")
include("ScalarEquations/ptc_scalar_example.jl")

end # module
