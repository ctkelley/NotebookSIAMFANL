# Solving Nonlinear Equations with Iterative Methods: <br> Solvers and Examples in Julia

## C. T. Kelley

## Preface: What is this thing?

This is the notebook that comes with the real book and the solvers. The solver
package is independent of the books, but you would be well advised to 
play with the notebook. The purpose of all of these things is to enable
the reader to learn about algorithms for nonlinear solvers. 

The book will be published in the SIAM Fundamentals of Algorithms (FA) series.

The provisional title is

### Solving Nonlinear Equations with Iterative Methods: Solvers and Examples in Juia

Hence the repositories have SIAMFANL in their names.

If you are reading this you have found the notebooks. The optimal way to use this is
to clone this repository and put it in your Julia **LOAD_PATH**. Then install the packages with the solvers using **pkg**.

One way to do that is to type

### import Pkg; Pkg.add("https://github.com/ctkelley/SIAMFANLEquations.jl")

in the REPL

If you want to play with the solvers, use the **dev** command within **pkg** to put the codes where it's easy for you to
get to them. Alternatively, you could close the repository for the package and put that in your Julia **LOAD_PATH**.

Since this is an education project, I do not expect the reader to be an expert
in Julia, but do expect the reader to be able to understand the codes, 
play with the algorithms, and wreak havoc. To that end I have tuned the 
codes for readability by a Julia novice who knows some numerical analysis. I made the algorithmic parameters very easy to find. As part of this I have sacrificed a lot of abstraction, some generality, and a bit of performance.

The reader should know Julia well enough to use the package manager, install packages, use modules, and to do basic tasks in 
numerical methods (LU, SVD, QR) in Julia. You should also know how to use github to clone repositories (like this one) and put them where they need to go.

## The algorithms.

## The solvers.
I've put the solvers in [SIAMFANLEquations.jl](https://github.com/ctkelley/SIAMFANLEquations.jl) 
This is a Julia package and you need it to run the examples in the notebook.

To install the package

-- Tell them how to get it

## The examples

The codes for every plot and table in the book are either in the src directory in this repository or in the notebooks. You'll get the chance to run them, change them, and make them better as you work through the notebook.

## Other Nonlinear Solvers in Julia

We have a very different mission from that of the other nonlinear solver
packages in Julia. 

Solvers like NLsolve.jl

https://github.com/JuliaNLSolvers/NLsolve.jl

are highly abstracted and very general. The Julia ecosystem has many 
codes of this type. They are very useful but hard to learn from.

At the high end, KINSOL is part of the Julia port of Sundials

https://github.com/SciML/Sundials.jl

Sundials is a suite of solvers from Lawrence Livermore National 
Laboratory that is designed for scalable performance on high-end
supercomputers. This is a well-done (by the very best people) and important project, but not one designed
for a novice to understand.

