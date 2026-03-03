#lang racket
(provide (all-defined-out))

; SUPPORTED OPERATIONS:
; - addition & subtraction
; - arcsine & sine
; - division & multiplication
; - exponent, logarithm, radical

(define (handle notnum expr)
  (cond [(not (number? expr)) (error "handle: The second argument is supposed to be a number.")]
        [(list? notnum) (case (length notnum)
                          [(2) ((first notnum) (second notnum) expr)]
                          [(3) ((first notnum) (second notnum) (third notnum) expr)]
                          [else (error "handle: The list is only supposed to have 2-3 elements.")])]
        [(string? notnum) expr]
        [(symbol? notnum) expr]
        [else (error "handle: The first argument is supposed to be either a string or a list")]))

; group: addition & subtraction

(define (add \1 \2 [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (- \3 \2))]
    [(list #t #f #t) (handle \2 (- \3 \1))]
    [(list #t #t #f) (handle \3 (+ \1 \2))]
    [(list #t #t #t) (+ \1 \2)]
    [(list #t #f #f) (list add \1 \2)]
    [(list #f #t #f) (list add \1 \2)]
    [(list #f #f #t) (list sub \3 \2)]
    [(list #f #f #f) (error "add: There should two unknowns at most.")]
    ))

(define (sub \1 \2 [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (+ \3 \2))]
    [(list #t #f #t) (handle \2 (- \1 \3))]
    [(list #t #t #f) (handle \3 (- \1 \2))]
    [(list #t #t #t) (- \1 \2)]
    [(list #t #f #f) (list sub \1 \2)]
    [(list #f #t #f) (list sub \1 \2)]
    [(list #f #f #t) (list add \3 \2)]
    [(list #f #f #f) (error "sub: There should two unknowns at most.")]
    ))

; group: arcsine & sine

(define (arcsine \1 [\2 "?"])
  (match (map number? (list \1 \2))
    [(list #f #t) (handle \1 (sine \2))]
    [(list #t #f) (handle \2 (radians->degrees (asin \1)))]
    [(list #t #t) (radians->degrees (asin \1))]
    [(list #f #f) (list arcsine \1)]
    ))

(define (sine \1 [\2 "?"])
  (match (map number? (list \1 \2))
    [(list #f #t) (handle \1 (arcsine \2))]
    [(list #t #f) (handle \2 (sin (degrees->radians \1)))]
    [(list #t #t) (sin (degrees->radians \1))]
    [(list #f #f) (list sine \1)]
    ))

; group: division & multiplication

(define (div \1 \2 [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (* \3 \2))]
    [(list #t #f #t) (handle \2 (/ \1 \3))]
    [(list #t #t #f) (handle \3 (/ \1 \2))]
    [(list #t #t #t) (/ \1 \2)]
    [(list #t #f #f) (list div \1 \2)]
    [(list #f #t #f) (list div \1 \2)]
    [(list #f #f #t) (list mul \3 \2)]
    [(list #f #f #f) (error "div: There should two unknowns at most.")]
    ))

(define (mul \1 \2 [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (/ \3 \2))]
    [(list #t #f #t) (handle \2 (/ \3 \1))]
    [(list #t #t #f) (handle \3 (* \1 \2))]
    [(list #t #t #t) (* \1 \2)]
    [(list #t #f #f) (list mul \1 \2)]
    [(list #f #t #f) (list mul \1 \2)]
    [(list #f #f #t) (list div \3 \2)]
    [(list #f #f #f) (error "mul: There should two unknowns at most.")]
    ))

; group: exponent, logarithm, radical

(define (exp \1 [\2 1] [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (expt \3 (/ 1 \2)))]
    [(list #t #f #t) (handle \2 (log \3 \1))]
    [(list #t #t #f) (handle \3 (expt \1 \2))]
    [(list #t #t #t) (expt \1 \2)]
    [(list #t #f #f) (list exp \1 \2)]
    [(list #f #t #f) (list exp \1 \2)]
    [(list #f #f #t) (list loga \3 \1)]
    [(list #f #f #f) (error "exp: There is supposed to be at least one known value.")]
    ))

(define (loga \1 [\2 10] [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (expt \2 \3))]
    [(list #t #f #t) (handle \2 (expt \1 (/ 1 \3)))]
    [(list #t #t #f) (handle \3 (log \1 \2))]
    [(list #t #t #t) (log \1 \2)]
    [(list #t #f #f) (list loga \1 \2)]
    [(list #f #t #f) (list loga \1 \2)]
    [(list #f #f #t) (list exp \2 \3)]
    [(list #f #f #f) (error "loga: There are is supposed to be at least one known value.")]
    ))

(define (rad \1 [\2 2] [\3 "?"])
  (match (map number? (list \1 \2 \3))
    [(list #f #t #t) (handle \1 (expt \3 \2))]
    [(list #t #f #t) (handle \2 (log \1 \3))]
    [(list #t #t #f) (handle \3 (expt \1 (/ 1 \2)))]
    [(list #t #t #t) (expt \1 (/ 1 \2))]
    [(list #t #f #f) (list rad \1 \2)]
    [(list #f #t #f) (list rad \1 \2)]
    [(list #f #f #t) (list loga \1 \3)]
    [(list #f #f #f) (error "rad: There are is supposed to be at least one known value.")]
    ))