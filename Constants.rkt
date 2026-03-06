#lang racket
(provide (all-defined-out))

(define (convert value unit1 unit2)
  (exact->inexact (cond [(not (number? value)) (error "convert: The first argument is supposed to be a number.")]
                        [(not (number? unit1)) (error "convert: The second argument is supposed to be a number.")]
                        [(not (number? unit2)) (error "convert: The third argument is supposed to be a number.")]
                        [(not (integer? (max (/ 10 unit1) (/ unit1 10)))) (convert value (expt 10 unit1) unit2)]
                        [(not (integer? (max (/ 10 unit2) (/ unit2 10)))) (convert value unit1 (expt 10 unit2))]
                        [else (* value (/ unit1 unit2))]
                        )))

(define (E10 \1 [\2 1])
  (* \1 (expt 10 \2)))

(define (Units Value)
  (case Value
    [("acceleration") "meters per second squared"]
    [("charge") "Coulombs"]
    [("current") "Amperes"]
    [("distance") "meters"]
    [("energy") "Joules"]
    [("force") "Newtons"]
    [("magnetic flux") "Weber"]
    [("power") "Watts"]
    [("radius") "meters"]
    [("resistance") "Ohms"]
    [("time") "seconds"]
    [("voltage") "Volts"]
    [(#t) ""]
    ))

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

; Week 1 - Introduction to Electricity.ppt

(define m_p (* 1.673 (expt 10 -27))) ; mass of proton, measured in kilograms, taken from slide 6
(define m_n (* 1.675 (expt 10 -27))) ; mass of neutron, measured in kilograms, taken from slide 6
(define m_e (* 9.11 (expt 10 -31))) ; mass of electron, measured in kilograms, taken from slide 6
(define e (* 1.60 (expt 10 -19))) ; value of charge, measured in Coulombs, taken from slide 8

; Week 1 - Electric Force.ppt

(define k (* 8.99 (expt 10 9)))
(define epsilon_0 (* 8.85 (expt 10 -12)))