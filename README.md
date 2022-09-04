<img width = 400, src = "https://user-images.githubusercontent.com/10243067/184649605-c70ef2d9-f80f-4502-bd88-2eeffcc7b741.jpg">

# Notebook for 
# [Solving Nonlinear Equations with Iterative Methods: <br> Solvers and Examples in Julia](https://my.siam.org/Store/Product/viewproduct/?ProductId=44313635)
## Published well in time for holiday giving.

## This is version 1.0. The book is out and this project is __finished__.

## This is the archival version as of the date of publication.

<!--
## The archival version 1.0 from the date of publication is in the FA20 branch.
-->

I am now running this with 1.8.0 on Intel Macs and Apple M1/M2 in native mode.

# Use the latest release of [SIAMFANLEquations.jl](https://github.com/ctkelley/SIAMFANLEquations.jl) with this version of the notebook. 

## [C. T. Kelley](https://ctk.math.ncsu.edu)

## Contents

- [Quick start guide](#If-you-know-what-to-do): Fast starting for those who have done this before.

- [Mission](#What-is-this-thing): What is this thing and why do you care?

- [Getting Started](#Getting-Started): Things you need to do before anything works.

- [How much Julia do you need to know?](#Julia-Prerequisites): You need to know something about Julia. You do not need to be an expert.

- [The Algorithms](#The-Algorithms): Pointers to the literature for theory

- [Other Nonlinear Solvers in Julia](#Other-Nonlinear-Solvers-in-Julia): Three other packages with very different missions.

- [Notebook Problems?](#Notebook-Problems) What? You're having trouble starting the notebook?

- [How to cite this stuff](#Citations)

- [Das Ende](#Das-Ende)

- [Funding](#Funding): Thanks!

## If you know what to do
- Install the package with **Pkg.add("SIAMFANLEquations")**
- Clone this repository.
- Fire up an IJulia notebook and open SIAMFANL.ipynb.
- Follow the directions in the preface and the "How to get the software" sections.


## What is this thing?

These are the notebooks that come with the print book and the solvers. The solver
package is independent of the books, but you would be well advised to 
play with the notebooks. The purpose of all of these things is to enable
the reader to learn about algorithms for nonlinear solvers. Please read the preface in 
the first notebook (Part1) for a more detailed mission statement.

The book is a sequal to my 2003 book in SIAM Fundamentals of Algorithms (FA) series.

(Kel03) [***Solving Nonlinear Equations with Newton's Method***](https://my.siam.org/Store/Product/viewproduct/?ProductId=841) , Fundamentals of Algorithms 1, SIAM 2003


The title is

**Solving Nonlinear Equations with Iterative Methods: Solvers and Examples in Julia**

Hence the repositories have SIAMFANL in their names.

## Getting started

If you are reading this you have found the notebooks. The optimal way to use this is
to clone this repository. Then install the package with the solvers using **pkg**.

One way to do that is to type
```
import Pkg; Pkg.add("SIAMFANLEquations")
```

or

```
] add SIAMFANLEquations
```

in the REPL. 

The next step is to open the notebooks. An efficient way to do this (after installing IJulia) is to type **using IJulia** and  **notebook()** in the REPL. Then navigate to the directory where the notebooks are and click on SIAMFANL.ipynb.

In the first code window in each of the notebooks you will find

```Jula
include("fanote_init.jl")
```
This is a Julia script that tells the notebooks where everything is. In partcular, the script lets the notebook find the examples.
You might enjoy poking around in the __/src__ subdirectory.

To get everything to work, you will need to add a few packages. LinearAlgebra, SuiteSparse, SparseArrays, BandedMatrices, BenchmarkTools, AbstractFFTs, FFTW, IJjulia, LaTeXStrings, and PyPlot. I put 

```Julia
using LinearAlgebra
using SuiteSparse
using SparseArrays
using BandedMatrices
using BenchmarkTools
using AbstractFFTs
using FFTW
using IJulia
```

in my startup.jl file and do **using PyPlot** when I need it. PyPlot takes a while to get going.

All this is also in the first code window in the notebooks. If Julia complains about a missing package, it is your job to add it.

If you want to play with the source code solvers, clone the repository for the package and put that in your Julia **LOAD_PATH** or use __Pkg.develop__. The most operating system independent way to do it is with __Pkg.develop__, but that is also the most challenging for a novice to figure out. 
 
## Julia Prerequisites

Since this is an education project, I do not expect the reader to be an expert
in Julia, but do expect her/him to be able to understand the codes, 
play with the algorithms, and wreak havoc. To that end I have tuned the user interface for the
codes for readability by a Julia novice who knows some numerical analysis. I made the algorithmic parameters very easy to find. As part of this I have sacrificed a lot of abstraction, some generality, and a bit of performance.

The reader should know (or learn) Julia well enough to use the package manager, install packages, use modules, and to do basic tasks in 
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

The codes for every plot and table in the book are either in the src directory in this repository or in the src directory in __SIAMFANL.jl__. You'll get the chance to run them, change them, and make them better/worse/shinier as you work through the notebooks. The organization is

- src/ChapterX in the notebook repo has the examples for the print-->notebook map

- src/TestProblems in the repo for __SIAMFANL.jl__ has the test problems and case studies for the book. You do ```using SIAMFANL.TestProblems``` to get to them.

- src/Examples in the repo for __SIAMFANL.jl__ has many examples that I use in the and for CI. You do ```using SIAMFANL.Examples``` to get to them.

## fanote_init.jl

The second window in each notebook has one line
```
include("fanote_init.jl")
```
This is important.

I include the __fanote_init.jl__ script in every notebook to make sure that things are where they are supposed to be. The important part of the source for __fanote_init.jl__ is

```
using SIAMFANLEquations
using SIAMFANLEquations.TestProblems
using SIAMFANLEquations.Examples
using LinearAlgebra
using BandedMatrices
using BenchmarkTools
using PyPlot
push!(LOAD_PATH,"./src")
using NotebookSIAMFANL
```
Do not mess with it.

I've also tweaked the way Julia prints floating point numbers in __fanote_init.jl__ with these lines
```
using Printf
Base.show(io::IO, f::Float64) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float32) = @printf(io, "%1.5e", f)
Base.show(io::IO, f::Float16) = @printf(io, "%1.5e", f)
```
These make floats print with only five digts after the decimal point. Without this the notebook can be very hard to read.

## Other Nonlinear Solvers in Julia

We have a very different mission from that of the other nonlinear solver
packages in Julia. Three of the most complete packages are
Sundials.jl,
BifurcationKit.jl, and NLsolve.jl.

At the high end, KINSOL is part of the Julia port of Sundials

https://github.com/SciML/Sundials.jl

Sundials is a suite of solvers from Lawrence Livermore National 
Laboratory that is designed for scalable performance on high-end
supercomputers. This is a well-done (by the very best people) and important project, but not one designed
for a novice to understand.

The pathfollowing and bifurcation analysis package BifurcationKit.jl

https://github.com/rveltz/BifurcationKit.jl

has speical-purpose nonlinear solvers that communicate well with continuation algorithms. 

Solvers like NLsolve.jl

https://github.com/JuliaNLSolvers/NLsolve.jl

are highly abstracted and very general. The Julia ecosystem has many 
codes like this for all kinds of things. They are very useful but hard to learn from. 
This one seems to be based on Dennis and Schnabel's 1983 book. 


## Notebook Problems
It is very important that PyPlot and IJulia use the same version of conda and the IJulia knows what versioh of Julia you are using. If the notebook is complaining about the kernel, that is likely the issue. You have a good chance of fixing this by typing __build IJulia__ from pkg. To do this from the REPL type
```
using Pkg
Pkg.build("IJulia")
```

If that fails ...

The worst case, which has happened to me more than once, is that you'll have to 

   1. Move .julia/config to a safe place.
      1. Your startup.jl lives in config. Don't lose it.
        
   2. Delete or move .julia
   
   3. Run Julia (which will create a new .julia in your home directory)
      1. Install PyPlot and IJulia and make sure both work.
      
   3. Reinstall ALL YOUR PACKAGES! That is a real pain, but has never failed to fix the problem for me.
      1. Close and restart Julia to make sure none of your other packages was the problem for the notebooks.
   
   4. Put your config directory back in .julia. 
      1. Close and restart Julia to make sure your startup.jl file was not causing any problems.
   
See the tales of woe at 
   1. https://discourse.julialang.org/t/ijulia-do-not-run/45409/10 , 

   2. https://discourse.julialang.org/t/unable-to-install-ijulia/47160 ,

   3. https://discourse.julialang.org/t/ijulia-notebook-failed-to-launch-the-ijulia-notebook-in-my-browser/37078 , and

   4. https://discourse.julialang.org/t/ijulia-do-not-run/45409/4 ,
   
where this seems to have happened to other people.   

## Citations 
Cite the package, print book and notebook like this. 
```
@misc{ctk:siamfanl,
title="{SIAMFANLEquations.jl}",
author="C. T. Kelley",
year=2022,
note="Julia Package",
doi="10.5281/zenodo.4284807",
url="https://github.com/ctkelley/SIAMFANLEquations.jl"
}

@book{ctk:fajulia,
author="C. T. Kelley",
title="{Solving Nonlinear Equations with Iterative Methods:
Solvers and Examples in Julia}",
year=2022,
publisher="SIAM",
address="Philadelphia",
series="Fundamentals of Algorithms",
number=20
}

@misc{ctk:notebooknl,
title="{Notebook for Solving Nonlinear Equations with Iterative Methods:
Solvers and Examples in Julia}",
author="C. T. Kelley",
year=2022,
note="IJulia Notebook",
url="https://github.com/ctkelley/NotebookSIAMFANL",
doi="10.5281/zenodo.4284687"
}
```

## Das Ende

SIAM publised [the book](https://my.siam.org/Store/Product/viewproduct/?ProductId=44313635) is October 2022. This means that the project is __done__. I will not be adding new functionality to [SIAMFANLEquations](https://github.com/ctkelley/SIAMFANLEquations.jl) or new content to these notebooks. Future releases will only fix typos and bugs.

## Funding

This project was partially supported by
1. Army Research Office grant W911NF-16-1-0504 
2. National Science Foundation Grants
   1. OAC-1740309
   2. DMS-1745654
   3. DMS-1906446
3. Department of Energy grant DE-NA003967

Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author and do not necessarily reflect the views of the National Science Foundation, the Department of Energy, or the Army Research Office.
   
