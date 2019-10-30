#lang sicp

;; Exercise 1.3: Define a procedure that takes three numbers as arguments and returns the
;;               sum of the squares of the two large numbers.
(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (fn x y z)
  (cond
    ((and (>= x z) (>= y z)) (sum-of-squares x y))
    ((and (>= x y) (>= z y)) (sum-of-squares x z))
    ((and (>= z x) (>= y x)) (sum-of-squares z y))))

(fn 1 2 3) ; => 13
(fn 3 1 1)
