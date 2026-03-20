#lang racket
(provide (all-defined-out))

; f3.1.1

(define m_p (* 1.673 (expt 10 -27))) ; mass of proton, measured in kilograms, taken from slide 6
(define m_n (* 1.675 (expt 10 -27))) ; mass of neutron, measured in kilograms, taken from slide 6
(define m_e (* 9.11 (expt 10 -31))) ; mass of electron, measured in kilograms, taken from slide 6
(define e (* 1.60 (expt 10 -19))) ; value of charge, measured in Coulombs, taken from slide 8

; f3.1.2

(define k (* 8.99 (expt 10 9)))
(define epsilon_0 (* 8.85 (expt 10 -12)))