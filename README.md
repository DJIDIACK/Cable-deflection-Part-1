# Cable-deflection-Part-1

This project investigates the numerical simulation of a tensioned cable
subjected to a distributed load. The objective is to study the convergence
and accuracy of numerical methods by comparing approximate solutions with
an analytical reference solution.

Two numerical approaches are implemented:

- Polynomial collocation method (4th degree)
- Finite Element Method (FEM)

The results include displacement comparison, equilibrium residuals,
and absolute error analysis along the cable length.

This project was developed as part of a finite element method course
and is shared as a numerical mechanics and FEM learning project.

## Repository Structure

- `/matlab` : MATLAB implementation of analytical, collocation, and FEM solvers
- `/report` : Project report
- `/figures` : Simulation results and plots
- `/docs` : Problem description and theoretical background

## Requirements

- MATLAB (recommended R2021 or later)

## Run

Execute:

```matlab
main.m
