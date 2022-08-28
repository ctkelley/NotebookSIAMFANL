using Printf
Base.show(io::IO, f::Float64) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float32) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float16) = @printf(io, "%1.5e", f)
using LinearAlgebra
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples
using BandedMatrices
using BenchmarkTools
using PyPlot
push!(LOAD_PATH,"./src")
using NotebookSIAMFANL
