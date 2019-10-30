#lang sicp

;; Exercise 1.4: Our model of evaluation allows for combinations whose operators are compound expressions

;; In this function the operator in the expression that evaluates the result is a compound expression that
;; returns  either a + or - operator depending on the value of b.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
