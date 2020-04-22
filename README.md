# Solving Nonlinear Equations with Iterative Methods: <br> Solvers and Examples in Julia


## C. T. Kelley

## What is this thing?

This is the notebook that comes with the print book and the solvers. The solver
package is independent of the books, but you would be well advised to 
play with the notebook. The purpose of all of these things is to enable
the reader to learn about algorithms for nonlinear solvers. Please read the preface in 
the first notebook (Part1) for a more detailed mission statement.

The book will be published in the SIAM Fundamentals of Algorithms (FA) series.

The provisional title is

**Solving Nonlinear Equations with Iterative Methods: Solvers and Examples in Julia**

Hence the repositories have SIAMFANL in their names.

## Getting started

If you are reading this you have found the notebooks. The optimal way to use this is
to clone this repository and put it in your Julia **LOAD_PATH**. Then install the packages with the solvers using **pkg**.

One way to do that is to type

**import Pkg; Pkg.add("https://github.com/ctkelley/SIAMFANLEquations.jl")**

in the REPL

The next step is to open the notebooks. My way to do this (after installing IJulia) is to type **using IJulia** and  **notebook()** in the REPL. 

To get everything to work, you will need a few packages. LinearAlgebra, SuiteSparse, SparseArrays, AbstractFFTs, FFTW, IJjulia, JLD2, and PyPlot. I put 

using LinearAlgebra
using SuiteSparse
using SparseArrays
using AbstractFFTs
using FFTW
using IJulia
using JLD2

in my startup.jl file and do **using PyPlot** when I need it. PyPlot takes a while to get going.

If you want to play with the solvers, clone the repository for the package and put that in your Julia **LOAD_PATH**.

## How much Julia do you need to know? ##

Since this is an education project, I do not expect the reader to be an expert
in Julia, but do expect the reader to be able to understand the codes, 
play with the algorithms, and wreak havoc. To that end I have tuned the 
codes for readability by a Julia novice who knows some numerical analysis. I made the algorithmic parameters very easy to find. As part of this I have sacrificed a lot of abstraction, some generality, and a bit of performance.

The reader should know Julia well enough to use the package manager, install packages, use modules, and to do basic tasks in 
numerical methods (LU, SVD, QR) in Julia. You should also know how to use github to clone repositories (like this one) and put them where they need to go.

## The algorithms.

My two books on nonlinear equations

(CTK95) ***Iterative Methods for Linear and Nonlinear Equations*** , Frontiers in Applied Mathematics 16,  SIAM 1995
and
(CTK03) ***Solving Nonlinear Equations with Newton's Method*** , Fundamentals of Algorithms 1, SIAM 2003.

## The examples

The codes for every plot and table in the book are either in the src directory in this repository or in the notebooks. You'll get the chance to run them, change them, and make them better as you work through the notebook.

## Other Nonlinear Solvers in Julia

We have a very different mission from that of the other nonlinear solver
packages in Julia. Two of the most complete packages are NLsolve.jl and Sundials.jl.

Solvers like NLsolve.jl

https://github.com/JuliaNLSolvers/NLsolve.jl

are highly abstracted and very general. The Julia ecosystem has many 
codes like this for all kinds of things. They are very useful but hard to learn from.

At the high end, KINSOL is part of the Julia port of Sundials

https://github.com/SciML/Sundials.jl

Sundials is a suite of solvers from Lawrence Livermore National 
Laboratory that is designed for scalable performance on high-end
supercomputers. This is a well-done (by the very best people) and important project, but not one designed
for a novice to understand.

