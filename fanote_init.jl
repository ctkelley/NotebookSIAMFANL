VERSION==v"1.6.4" && error("Notebook will not work with 1.6.4. See
https://discourse.julialang.org/t/problems-in-1-6-4-with-ijulia-downgrade-to-1-6-3/72129/12")
using NotebookSIAMFANL
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples
using LinearAlgebra
using BandedMatrices
using BenchmarkTools
using PyPlot
push!(LOAD_PATH,"./src")
using NotebookSIAMFANL
