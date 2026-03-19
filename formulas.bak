#lang racket
(require "math_ops.rkt")
(require "Constants.rkt")

; Week 1 - Introduction to Electricity.ppt

(define (f1 \1 \2)
  (list [mul \1 e \2] ; taken from page 12
        (case (add1 (index-of (list \1 \2) "?"))
          [(1) "electrons"]
          [(2) "Coulombs"])
        ))

; Week 1 - Electric Force.ppt

(define (f2 \1 \2 \3 \4)
  (list [mul k [div [abs [mul \1 \2]] [exp \3 2]] \4] ; taken from page 6
        (case (add1 (index-of (list \1 \2 \3 \4) "?"))
          [(1) "Coulombs"]
          [(2) "Coulombs"]
          [(3) "meters"]
          [(4) "Newtons"])
        ))