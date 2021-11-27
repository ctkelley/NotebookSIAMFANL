function vcheck()
if (VERSION==v"1.6.4")
   println("Bug in Julia 1.6.4")
   println("See: https://discourse.julialang.org/t/problems-in-1-6-4-with-ijulia-downgrade-to-1-6-3/72129/10")
   println("Your best bet is to use 1.6.3")
error("Notebook will not work with Julia v1.6.4. ")
end
end
vcheck()
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples
using LinearAlgebra
using BandedMatrices
using BenchmarkTools
using PyPlot
push!(LOAD_PATH,"./src")
using NotebookSIAMFANL

