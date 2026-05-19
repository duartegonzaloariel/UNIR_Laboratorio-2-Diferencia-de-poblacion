# Laboratorio 2: Diferencia de Población Bacteriana

Numerical integration lab applying Trapezoidal and Simpson's rules to approximate 
bacterial population growth over time.

## Problem

Given the rate of change:

$$B'(t) = \frac{30e^{-0.1t}}{(1+3e^{-0.1t})^2}$$

Compute the population difference $B(20) - B(0) = \int_0^{20} B'(t)\,dt$ using 
numerical methods and compare with the exact analytical solution.

## Results

| Method | n | Result | Absolute Error |
|---|---|---|---|
| Exact | — | 46.123459 | — |
| Trapezoidal | 2 | 44.583318 | 1.540141 |
| Simpson | 2 | 46.348426 | 0.224967 |
| Trapezoidal | 10 | 46.063233 | 0.060227 |
| Simpson | 10 | 46.123679 | 0.000220 |

Final population: **B(20) ≈ 71.123459** bacteria (from B(0) = 25)

## Files

- `Trapecio_Simpson.m` — Exact value + Trapezoidal and Simpson with n=2
- `Trapecio_Simpson_masIntervalos.m` — Trapezoidal and Simpson with n=3 to 10

## Course

Métodos Numéricos Aplicados I — Máster Universitario en Ingeniería Matemática y Computación (UNIR)
