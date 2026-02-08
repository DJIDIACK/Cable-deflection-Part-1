# Problem Statement

The objective of this project is to study the deflection of a tensioned cable
subjected to a non-uniform distributed load. The problem is used as a benchmark
to evaluate the accuracy and convergence behavior of numerical approximation methods.

The cable is modeled as a one-dimensional structural system under constant
tension. The distributed load varies along the cable length, creating a
non-uniform deformation profile that requires numerical approximation.

Two numerical approaches are considered:

- A collocation method using a fourth-degree polynomial approximation.
- The finite element method (FEM), implemented in a generic framework allowing
  the use of an arbitrary number of elements.

The analytical solution is used as a reference to evaluate numerical results.
Comparisons are performed in terms of displacement, equilibrium residuals,
and absolute error distribution along the cable.

The study aims to illustrate convergence properties and provide a clear
comparison between approximation methods commonly used in computational mechanics.
