#lang sicp

;; Exercise 1.9: Use substitution model to illustrate the processes.

;; Fn A 
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(+ 2 3)
(inc (+ (dec 2) 3))
(inc (inc (+ (dec 1) 3)))
;; (inc (inc 3))
;; (inc 4)

;; ;; Fn B
;; (define (+ a b)
;;   (if (= a 0)
;;     b
;;     (+ (dec a) (inc b))))

;; (+ 2 3)
;; (+ (dec 2) (inc 3))
;; (+ (dec 1) (inc 4))
;; 5

; Fn A is recursive; B is iterative.
