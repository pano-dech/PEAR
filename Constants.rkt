#lang racket
; NECESSARY IMPORTS
(provide (all-defined-out))

; Metric prefixes
(define yocto (expt 10 -24))
(define zepto (expt 10 -21))
(define atto  (expt 10 -18))
(define femto (expt 10 -15))
(define pico  (expt 10 -12))
(define nano  (expt 10 -9))
(define micro (expt 10 -6))
(define milli (expt 10 -3))
(define centi (expt 10 -2))
(define deci  (expt 10 -1))
(define base  (expt 10 0))
(define deka  (expt 10 1))
(define hecto (expt 10 2))
(define kilo  (expt 10 3))
(define mega  (expt 10 6))
(define giga  (expt 10 9))
(define tera  (expt 10 12))
(define peta  (expt 10 15))
(define exa   (expt 10 18))
(define zetta (expt 10 21))
(define yotta (expt 10 24))

; Week 1, Introduction to Electricity.ppt

(define m_p (* 1.673 (expt 10 -27))) ; mass of proton, measured in kilograms, taken from slide 6
(define m_n (* 1.675 (expt 10 -27))) ; mass of neutron, measured in kilograms, taken from slide 6
(define m_e (* 9.11 (expt 10 -31))) ; mass of electron, measured in kilograms, taken from slide 6
(define e (* 1.60 (expt 10 -19))) ; value of charge, measured in Coulombs, taken from slide 8

; Week 1, Electric Force.ppt

(define k (* 8.99 (expt 10 9)))
(define epsilon_0 (* 8.85 (expt 10 -12)))