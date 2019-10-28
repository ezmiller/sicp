;; 1.2 Procedures and the Processes They Generate
;;

#lang sicp

;; Linear recursive method
;; Because n! = n * (n-1)!, and 1! = 1.
(define (factorial n)
  (if (= 1 n)
    1
    (* n (factorial (- n 1)))))

(factorial 3)
(factorial 6)

;; Linear iterative
(define (fact-iter product counter n)
  (if (> counter n)
    product
    (fact-iter (* product counter)
               (+ counter 1)
               n)))

(define (factorial2 n)
  (fact-iter 1 1 n))

(factorial2 3)
(factorial2 6)


;; Exercise 1.9: Use substitution model to illustrate the processes.
;;

;; Fn A 
; (define (+ a b)
;   (if (= a 0)
;     b
;     (inc (+ (dec a) b))))
;

; (+ 2 3)
; (inc (+ (dec 2) 3))
; (inc (inc (+ (dec 1) 3)))
; (inc (inc 3))
; (inc 4)
; 5

;; Fn B
; (define (+ a b)
;   (if (= a 0)
;     b
;     (+ (dec a) (inc b))))

; (+ 2 3)
; (+ (dec 2) (inc 3))
; (+ (dec 1) (inc 4))
; 5

; Fn A is recursive; B is iterative.

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
