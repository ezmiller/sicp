#lang sicp
(inc 52)

;; Exercise 1.2
(/
  (+ 5 4  (- 2 (- 3 (+ 6 (/ 4 5)))))
  (* 3 (- 6 2) (- 2 7)))


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

;; Exercise 1.4: Our model of evaluation allows for combinations whose operators are compound expressions

;; In this function the operator in the expression that evaluates the result is a compound expression that
;; returns  either a + or - operator depending on the value of b.
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

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

;; Excercise 1.6: Do we need `if`? Why not define it in terms of `cond`?
;;

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

; Okay that works. Rewrite square-root?

(define (average x y)
  (/ (+ x y) 2))

;; Test to see if a guess has become good enough.
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;; Newton's Method manipulation to get closer to the sqrt.
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 4) ;; works.

; No rewrite...

(define (sqrt-iter2 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter2 (improve guess x)
                      x)))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(sqrt2 4)

;; This gets stuck. Why? Because when using `cond` each parameter expression is evaluated even if
;; the predicate does not match. With the special form `if` this does not happen because it is excempted
;; from the normal model of (applicative) evaluation.
