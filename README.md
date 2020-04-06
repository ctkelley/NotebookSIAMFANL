# Solving Nonlinear Equations with Iterative Methods with Solvers and Examples in Julia

## C. T. Kelley

## What is this thing?

This is the notebook that comes the real book and the solvers. The solver
package is independent of the books, but you would be well advised to 
play with the notebook. The purpose of all of these things is to enable
the reader to learn about algorithms for nonlinear solvers. 

The book will be published in the SIAM Fundamentals of Algorithms (FA) serise. Hence the repositories
are named SIAMFANLxxx. If you are reading this you have found the notebooks. The optimal way to use this is
to close this repository and put it in your Julia **LOAD_PATH**. Then install the packages with the solvers using **pkg**.
If you want to play with the solvers, use the **dev** command within **pkg** to put the codes where it's easy for you to
get to them. Alternatively, you could close the repository for the package and put that in your Julia **LOAD_PATH**.

Since this is an education project, I do not expect the reader to be an expert
in Julia, but do expect the reader to be able to understand the codes, 
play with the algorithms, and wreak havoc. To that end I have tuned the 
codes for readability by a Julia novice who knows some numerical analysis.

The reader should know Julia well enough to use the package manager, install packages, use modules, and to do basic tasks in 
numerical methods (LU, SVD, QR) in Julia.

## The solvers

I've put the solvers in SIAMFANLSolvers.jl 

-- Tell them how to get it

## The examples

The codes for every plot and table in the book are in the src directory in this repository. You'll get the change to run them, change them, and make them better as you work through the notebook.

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
supercomputers. This is a very important project, but not one designed
for a novice to understand.

