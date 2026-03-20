#lang racket
(require "E1-C.rkt")
(require (file "../mops.rkt"))

(define (f1 \1 \2 \3 \4 [\5 "?"])
  (list (mul \1 (add \2 (mul \3 \4)) \5)
        (case (add1 (index-of (list \1 \2 \3 \4 \5)))
          [(1) "Coulombs"]
          [(2) "Newtons"]
          [(3) "meters per second"]
          [(4) "Tesla"]
          [(5) "Newtons"]
          )))

(mul (ten 8.99 9)
     (div (mul (ten 2.38 28) (ten 1.6 -19))
          (exp 0.3 2)