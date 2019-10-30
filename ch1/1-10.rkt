#lang sicp

;; Exercise 1.10:  Ackermann's function
;;
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; three uses of this fn
(define (f n) (A 0 n)) ; => f(n) = 2x
(define (g n) (A 1 n)) ; => g(x) = 2^x
(define (h n) (A 2 n))

;; Exercise 1.11: Writing a recurseive process for a fn defined such that f(n) = n if n < 3
;; and f(n) = f(n -1) + 2f(n - 2) + 3f(n - 3) if n >= 3.

(define (fn n)
  (if (< n 3)
      n
      (+
       (fn (- n 1))
       (* 2 (fn (- n 2)))
       (* 3 (fn (- n 3))))))

(fn 1)
(fn 2)
(fn 3)
(fn 4)


(define (fn n)
  )

(define (fn-iter a b counter)
  (if (= 0 counter)
      ))
