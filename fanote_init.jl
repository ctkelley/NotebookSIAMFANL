# Test for bad version of Julia. I will remove this for 1.0
## Delete starts here
#
using LinearAlgebra
function vcheck()
if (VERSION==v"1.7.0")
mklok = any(contains("mkl"), getfield.(BLAS.get_config().loaded_libs, :libname))
else
mklok = false
end
blasproblem = ~mklok && (VERSION==v"1.6.4")
if blasproblem
error("OpenBLAS + Notebook will not work with Julia v1.6.4 or v1.7.0. ")
end
end
vcheck()
#
## Delete ends here
#
using Printf
Base.show(io::IO, f::Float64) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float32) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float16) = @printf(io, "%1.5e", f)
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples
using BandedMatrices
using BenchmarkTools
using PyPlot
push!(LOAD_PATH,"./src")
using NotebookSIAMFANL
