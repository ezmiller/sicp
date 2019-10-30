#lang sicp

;; Exercise 1.5: A test to determine whether the interpreter is using applicative- or normal-order evaluation.

(define (p) (p)) ;; This is a procedure that just returns itself.

(define (test x y)
  (if (= x 0)
    0
    y))

;; Then we evaluate the following:

; (test 0 (p))

;; What will happen? With applicative order, this would never end because the interpreter would try
;; to evaluate the `(p)`,  getting back another combination that needs to be evaluated. In normal-order
;; evaluation, the result would be 0 because the evaluation would reach the if expression and then because
;; x = 0 return 0.

