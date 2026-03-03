#lang racket
(require "math_ops.rkt")
(require "Constants.rkt")

(define (Units Value)
  (case Value
    [("acceleration") "meters per second squared"]
    [("charge") "Coulombs"]
    [("current") "Amperes"]
    [("distance") "kilometers"]
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

(define (convert value unit1 unit2)
  (exact->inexact (* value (/ unit1 unit2))))

(define (f1 \1 \2 \3 [\4 "?"])
  (list (div (* k (abs (mul \1 \2))) (exp \3 2) \4)
        (case (add1 (index-of (list \1 \2 \3 \4) "?"))
          [(1) (Units "charge")]
          [(2) (Units "charge")]
          [(3) (Units "radius")]
          [(4) (Units "force")])
        ))
[f1 (convert -2 micro base) (convert 5 micro base) (convert 2 centi base)]