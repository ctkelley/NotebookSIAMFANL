# Solving Nonlinear Equations with Iterative Methods: <br> Solvers and Examples in Julia


## [C. T. Kelley](https://ctk.math.ncsu.edu)

## Contents

- [Mission](#What-is-this-thing): Purpose 

- [Quick start guide](#If-you-know-what-to-do): Fast starting for those who have done this before.

- [Getting Started](#Getting-Started): Things you need to do before anything works.

- [How much Julia do you need to know?](#Julia-Prerequisites): You need to know something about Julia

- [The Algorithms](#The-Algorithms): Pointers to the literature for theory

- [Other Nonlinear Solvers in Julia](#Other-Nonlinear-Solvers-in-Julia): Two other packages with very different missions.

- [Support](#Support): Thanks!

## If you know what to do

- Clone this repository. Put the directory in your Julia load path
- Fire up an IJulia notebook and open SIAMFANL.ipynb
- Follow the directions


## What is this thing?

These are the notebooks that come with the print book and the solvers. The solver
package is independent of the books, but you would be well advised to 
play with the notebooks. The purpose of all of these things is to enable
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

in the REPL.

The next step is to open the notebooks. My way to do this (after installing IJulia) is to type **using IJulia** and  **notebook()** in the REPL. 

In the first code window in each of the notebooks you will find

**using SIAMFANLEquations**<br>
**using SIAMFANLEquations.TestProblems**


To get everything to work, you will need a few packages. LinearAlgebra, SuiteSparse, SparseArrays, AbstractFFTs, FFTW, IJjulia, JLD2, and PyPlot. I put 

using LinearAlgebra
using SuiteSparse
using SparseArrays
using AbstractFFTs
using FFTW
using IJulia
using JLD2

in my startup.jl file and do **using PyPlot** when I need it. PyPlot takes a while to get going.

All this is also in the first code window in the notebook. If Julia complains about a missing package, it is your job to add it.

If you want to play with the solvers, clone the repository for the package and put that in your Julia **LOAD_PATH**.

## Julia Prerequisites

Since this is an education project, I do not expect the reader to be an expert
in Julia, but do expect the reader to be able to understand the codes, 
play with the algorithms, and wreak havoc. To that end I have tuned the 
codes for readability by a Julia novice who knows some numerical analysis. I made the algorithmic parameters very easy to find. As part of this I have sacrificed a lot of abstraction, some generality, and a bit of performance.

The reader should know Julia well enough to use the package manager, install packages, use modules, and to do basic tasks in 
numerical methods (LU, SVD, QR) in Julia. You should also know how to use github to clone repositories (like this one) and put them where they need to go.

## The algorithms.

My two books on nonlinear equations

(Kel95) [***Iterative Methods for Linear and Nonlinear Equations***](https://my.siam.org/Store/Product/viewproduct/?ProductId=862) , Frontiers in Applied Mathematics 16,  SIAM 1995

and

(Kel03) [***Solving Nonlinear Equations with Newton's Method***](https://my.siam.org/Store/Product/viewproduct/?ProductId=841) , Fundamentals of Algorithms 1, SIAM 2003

describe the Newton and Broyden algoirthms. CTK95 has the theory. This project is a sequal to CTK03. CTK03 is Matlab-centric
and will remain in print.

A recent Acta Numerica paper has everything

(Kel18) C. T. Kelley, ***Numerical Methods for Nonlinear Equations***, Acta Numerica 27 (2018), pp 207--287. https://doi.org/10.1017/S0962492917000113

The references I use for theory of pseudo-transient continuation and Anderson acceleration are

(KK98) C. T. Kelley and D. E. Keyes, ***Convergence Analysis of Pseudo-Transient Continuation***, SIAM Journal on Numerical Analysis 35 (1998), pp 508-523. https://doi.org/10.1137/S0036142996304796

(TK15) A. Toth and C. T. Kelley, ***Convergence Analysis for Anderson Acceleration***, SIAM Journal on Numerical Analysis 53, (2015), pp 805-819. https://doi.org/10.1137/130919398

These references have extensive bibliographies as does the print book. The notebooks have smaller bibliographies because a lengthy list of citations is hard to parse and looks ugly in a notebook.

## The examples

The codes for every plot and table in the book are either in the src directory in this repository or in the notebooks. You'll get the chance to run them, change them, and make them better/worse/shinier as you work through the notebooks. 

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

## Support

This project was partially supported by
1. Army Research Office grant W911NF-16-1-0504 and
2. National Science Foundation Grants
   1. OAC-1740309
   2. DMS-1745654
   3. DMS-1906446
   
Any opinions, findings, and conclusions or
recommendations expressed in this material are those of the author and
do not necessarily reflect the views of the National
Science Foundation
or the Army Research Office.
