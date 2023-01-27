# Finding zeros of a function
For a given function $f:\mathbb{R}^n\longrightarrow\mathbb{R}^n$ we will find an $x\in\mathbb{R}^n$ such that $f(x)=0$ via different iteraive methods. The following files are included in this repository:\
`secant.m`: the file computes via the secant method the zero of a given function $f:\mathbb{R}\longrightarrow\mathbb{R}$ in a given iterval $[a,b]\subset\mathbb{R}$, if such zero exists.\
`iteracio_simple.m`: the file computes the zero of a given contractive function $f:\mathbb{R}\longrightarrow\mathbb{R}$ from a given initial approximation via the recurrence $x_k=f(x_{k-1})$.\
`newton.m`: the file computes via the unidimensional Newton method the zero of a given function $f:\mathbb{R}\longrightarrow\mathbb{R}$ from a given initial approximation.\
`nnewton.m`: the file computes via the multidimensional Newton method the zero of a given function $f:\mathbb{R}^n\longrightarrow\mathbb{R}^n$ from a given initial approximation.\
`exemples_nnewton.m`: the file contains two examples of use of the `nnewton.m` file.

